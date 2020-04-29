#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture sampler
uniform vec2 resolution;

uniform sampler2D noise_texture;
uniform sampler2D pmwo_texture;
uniform sampler2D normal_texture;

vec4 CalcMaterialWeights( float material )
{
	float delta = 0.01;
	float slope = 1.0 / ( 1.0 / 3.0 - 2.0 * delta );
	float offset = 1.0 + delta * slope;
	vec4 result = vec4(offset) - abs( slope * ( vec4(material) - vec4( 0.0, 1.0 / 3.0, 2.0 / 3.0, 1.0 ) ) );
    return clamp(result, vec4(0.0), vec4(1.0));
}

// 计算normal
vec3 cal_normal(vec2 uv)
{
    // 计算分块的权重
    vec3 pmwocolor = texture(pmwo_texture, uv).xyz;
    vec4 material_weight = CalcMaterialWeights(pmwocolor.y);

    // detail 贴图的采样
    vec4 DetailData = vec4(4.0, 5.0, 0.0, 0.0);
    vec4 DetailSelector = vec4(1.0, 1.0, 0.5, 0.5);
    vec2 detail_uv = DetailData.x * uv;
    vec3 detail_color = texture(noise_texture, detail_uv).xyz;
    vec3 normal_offset = 2.0 * detail_color - vec3(1.0);

    // 根据分块权重计算detail normal offset强度
    float detail_strength = dot(DetailSelector, material_weight);
    normal_offset = DetailData.y * detail_strength * normal_offset;

    // 原有normal贴图
    vec3 normal = texture(normal_texture, uv).xyz;
    vec2 n_off_xy = normal.xy * 2.0 - 1.0;
    float dot_xy = clamp(dot(n_off_xy, n_off_xy), 0.0, 1.0);
    float n_off_z = sqrt(1.0 - dot_xy);

    return vec3(n_off_xy, n_off_z) + normal_offset;
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
    
    float alter_power = 100.0;
    ft /= mix(alter_power/fixed_power, 1.0, ft);
    
    // test
    // vec3 test_color = texture(pmwo_texture, pos).xyz;
    FragColor = vec4(vec3(ft), 1.0);
    // FragColor = vec4(test_color, 1.0);
}