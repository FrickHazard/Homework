#define PI 3.1415926538
#define ITERATION_COUNT 12
const int fact[ITERATION_COUNT]=int[](1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
float powerCos(float x,float t)
{
    x = mod(x+PI,2.*PI)-PI;
    float r = 0.;
    for(int i=0;i<(ITERATION_COUNT/2);++i)
    {
        float weight = (1. - (float(i) / float(ITERATION_COUNT/2-1)));
        r += (pow(-1., float(i)) * pow(x, 2. * float(i))) * (1. / float(fact[i * 2]));
    }
    return 1. - r;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord / iResolution.xy;

    // Time varying pixel color
    vec3 col = vec3(powerCos(iTime * PI, 1.), powerCos(iTime, 0.5), 0.5);

    // Output to screen
    fragColor = vec4(col, 1.);
}