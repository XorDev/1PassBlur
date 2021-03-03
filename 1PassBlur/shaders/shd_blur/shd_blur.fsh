//Number of texture samples. Higher = smoother, slower
#define SAMPLES 32.

//Texel size, blur radius
uniform vec2 texel;
uniform float radius;

varying vec4 v_color;
varying vec2 v_coord;

//Normalized 2D hash function
vec2 hash2(vec2 p)
{
	return normalize(fract(cos(p*mat2(195,174,286,183))*742.)-.5);
}

void main()
{
	//Initialize blur output color
	vec4 blur = vec4(0);
	//Total weight from all samples
	float total = 0.;
	
	//First sample offset scale
	float scale = radius/sqrt(SAMPLES);
	//Pseudo-random sample direction
	vec2 point = hash2(v_coord)*scale;
	//Try without noise here:
	//vec2 point = vec2(scale,0);
	
	//Radius iteration variable
	float rad = 1.;
	//Golden angle rotation matrix
	mat2 ang = mat2(.73736882209777832,-.67549037933349609,.67549037933349609,.73736882209777832);
	
	//Look through all the samples
	for(float i = 0.;i<SAMPLES;i++)
	{
		//Rotate point direction
		point *= ang;
		//Iterate radius variable. Approximately 1+sqrt(i)
		rad += 1./rad;
		
		//Get sample coordinates
		vec2 coord = v_coord + point*(rad-1.)*texel;
		//Set sample weight
		float weight = 1./rad;
		//Sample texture
		vec4 samp = texture2D(gm_BaseTexture,coord);
		
		//Add sample and weight totals
		blur += samp * weight;
		total += weight;
	}
	//Divide the blur total by the weight total
	blur /= total;
	//Output result
	gl_FragColor = v_color * blur;
}
