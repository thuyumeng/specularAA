#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture sampler
uniform vec2 resolution;

uniform sampler2D normal_texture;

// 计算normal
vec3 cal_normal(vec2 uv)
{
    vec3 normal = texture(normal_texture, uv).xyz;
    vec2 n_off_xy = normal.xy * 2.0 - 1.0;
    float dot_xy = clamp(dot(n_off_xy, n_off_xy), 0.0, 1.0);
    float n_off_z = sqrt(1.0 - dot_xy);
    return vec3(n_off_xy, n_off_z);
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

    FragColor = vec4(vec3(ft), 1.0);
}