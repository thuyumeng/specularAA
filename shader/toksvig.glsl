// bind do_toksvig {label:"Toksvig AA",  default:false}
// bind do_toksmap {label:"Toksvig Map", default:false}
// bind show_gloss {label:"Show Gloss",  default:false}
// bind power      {label:"Glossiness",  default:100, max:200, step:1}
// bind cdiff      {label:"Diffuse Colour",  r:0.5,  g:0.13, b:0.1}
// bind cspec      {label:"Specular Colour", r:0.57, g:0.57, b:0.57}

varying vec2 texcoord;
varying vec3 wview;
varying vec3 wnormal;
varying vec3 wtangent;

uniform sampler2D normal_map;
uniform sampler2D gloss_map;

uniform bool do_toksvig;
uniform bool do_toksmap;
uniform bool show_gloss;

uniform float power;

uniform vec3 cdiff;
uniform vec3 cspec;

float baked_power = 100.0;
vec3 light = normalize(vec3(1, 1, 1));


// Helper functions
///////////////////

float saturate(float v)
{
    return clamp(v, 0.0, 1.0);
}

vec3 pow_vec3(vec3 v, float p)
{
    return vec3(pow(v.x, p), pow(v.y, p), pow(v.z, p));
}

const float gamma = 2.2;

vec3 ToLinear(vec3 v) { return pow_vec3(v,     gamma); }
vec3 ToSRGB(vec3 v)   { return pow_vec3(v, 1.0/gamma); }


float Gloss(vec3 bump)
{
    float gloss = 1.0;

    if (do_toksvig)
    {
        // Compute the "Toksvig Factor"
        float rlen = 1.0/saturate(length(bump));
        gloss = 1.0/(1.0 + power*(rlen - 1.0));
    }

    if (do_toksmap)
    {
        // Fetch pre-computed "Toksvig Factor"
        // and adjust for specified power
        gloss = texture2D(gloss_map, texcoord).r;
        gloss /= mix(power/baked_power, 1.0, gloss);
    }

    return gloss;
}


void main()
{
    // Unpack normal map
    vec3 bump = texture2D(normal_map, texcoord.xy).xyz;
    bump = bump*2.0 - 1.0;

    // Transform normal to world-space
    vec3 wbitangent = cross(wnormal, wtangent);
    mat3 t2w = mat3(wtangent, wbitangent, wnormal);
    vec3 n = normalize(t2w*bump);

    // Other vectors for lighting
    vec3 view  = normalize(wview);
    vec3 h     = normalize(view + light);

    // Compute 'anti-aliasing' gloss map
    float gloss = Gloss(bump);

    // Energy conserving Blinn-Phong
    float ndoth = saturate(dot(n, h));
    float p     = power*gloss;
    float spec  = pow(ndoth, p)*(p + 2.0)/8.0;

    // Linearise material properties
    vec3 cd = ToLinear(cdiff);
    vec3 cs = ToLinear(cspec);

    // Combine diffuse and specular lighting
    float ndotl = saturate(dot(n, light));
    vec3  color = (cd + cs*spec)*ndotl;

    // Convert to sRGB for display
    color = ToSRGB(color);

    if (show_gloss)
        color = vec3(gloss, gloss, gloss);

    gl_FragColor = vec4(color, 1.0);
}