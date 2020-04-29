#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture sampler
uniform vec2 resolution;

uniform sampler2D detail1;
uniform sampler2D detail2;
uniform sampler2D detail3;

vec4 Detail1Data = vec4(1.000000,0.500000,0.000000,0.000000);
vec4 Detail2Data = vec4(5.000000,0.500000,0.000000,0.000000);
vec4 Detail3Data = vec4(1.000000,2.000000,0.000000,0.000000);

// 计算normal
vec3 cal_normal(vec2 uv)
{
	vec2 detail1UV = Detail1Data.x * uv + Detail1Data.zw;
	vec2 detail2UV = Detail2Data.x * uv + Detail2Data.zw;
    vec2 detail3UV = Detail3Data.x * uv + Detail3Data.zw;

	vec3 detail1Txl = texture(detail1, detail1UV).xyz;
	vec3 detail2Txl = texture(detail2, detail2UV).xyz;
    vec3 detail3Txl = texture(detail3, detail3UV).xyz;

	vec3 detail1NrmOffset = 2.0 * detail1Txl.xyz - vec3(1.0, 1.0, 1.0);
	vec3 detail2NrmOffset = 2.0 * detail2Txl.xyz - vec3(1.0, 1.0, 1.0);
    vec3 detail3NrmOffset = 2.0 * detail3Txl.xyz - vec3(1.0, 1.0, 1.0);

	vec3 normalOffset = -1.0 * (detail1NrmOffset + detail2NrmOffset + detail3NrmOffset);
    return normalOffset;
}

float gaussian_weight(vec2 p)
{
    const float pi = 3.1415927;
    // 高斯滤波置信半径
    float sigma_radius = 1.0;
    float v = 2.0 * sigma_radius * sigma_radius;
    return exp(-(dot(p, p) / v)) / (pi*v);
}

vec4 fetch(vec2 uv, vec2 offset)
{
    vec3 n = cal_normal(uv + offset/resolution.xy);
    n = normalize(n);
    return vec4(n, 1.0)*gaussian_weight(offset);
}

float calc_toksvig(vec2 pos, float power)
{
    vec4 n;

    // 3x3 filter
    n  = fetch(pos, vec2(-1, -1));
    n += fetch(pos, vec2( 0, -1));
    n += fetch(pos, vec2( 1, -1));

    n += fetch(pos, vec2(-1,  0));
    n += fetch(pos, vec2( 0,  0));
    n += fetch(pos, vec2( 1,  0));

    n += fetch(pos, vec2(-1,  1));
    n += fetch(pos, vec2( 0,  1));
    n += fetch(pos, vec2( 1,  1));

    // Divide by weight sum
    n.xyz /= n.w;

    float len = length(n.xyz);

    // Toksvig Factor
    float ft = len/mix(power, 1.0, len);
    return ft;
}

void main()
{
	//FragColor = texture(texture1, TexCoord);
    // 预处理
    vec2 pos = vec2(TexCoord.x, 1.0 - TexCoord.y);
    float fixed_power = 100.0;
    float ft = calc_toksvig(pos, fixed_power);
    
    float alter_power = 10.0;
    ft /= mix(alter_power/fixed_power, 1.0, ft);

    // FragColor = vec4(vec3(1.0 - gloss, rgcolor.yz), 1.0);
    vec3 test1 = texture(detail3, TexCoord).xyz;
    FragColor = vec4(vec3(ft), 1.0);
    // FragColor = vec4(test1, 1.0);
}