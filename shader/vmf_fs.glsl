#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord;

// texture sampler
uniform vec2 resolution_mip0;
uniform int miplevel;

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

vec3 calculate_roughness(vec2 uv, int miplevel)
{
    if (miplevel == 0) {
        // 不对roughness调整
        return vec3(0.0);
    } else {
        vec3 avgNormal = vec3(0.0);
        int texelFootprint = (1 << miplevel);
        vec2 topleft = -0.5 * vec2(texelFootprint * 1.0) / resolution_mip0.xy;
        float test = 0.0;
        for(int y = 0; y < texelFootprint; y++) {
            for(int x = 0; x < texelFootprint; x++) {
                vec2 offset = topleft + vec2( x * 1.0 / resolution_mip0.x, y * 1.0 / resolution_mip0.y);
                vec2 samplepos = uv + topleft + offset;
                vec3 n = cal_normal(samplepos);
                n = normalize(n);
                avgNormal += n;

            }
        }
        float footprint = texelFootprint * 1.0;
        avgNormal /= (footprint * footprint);
        float r = length(avgNormal);
        float kappa = 10000.0;
        if (r < 1.0) {
            kappa = (3.0 * r - r * r * r) / (1.0 - r);
        }
        return vec3(1.0 / kappa);
    }
}

void main()
{
	//FragColor = texture(texture1, TexCoord);
    // 预处理
    vec2 pos = vec2(TexCoord.x, 1.0 - TexCoord.y);
    vec3 ft = calculate_roughness(pos, miplevel);

    // FragColor = vec4(vec3(1.0 - gloss, rgcolor.yz), 1.0);
    //vec3 test1 = texture(detail1, TexCoord).xyz;
    FragColor = vec4(vec3(ft), 1.0);
    // FragColor = vec4(test1, 1.0);
}