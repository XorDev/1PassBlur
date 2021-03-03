function blur_init()
{
	//Set shader uniforms
	global.uni_texel = shader_get_uniform(shd_blur,"texel");
	global.uni_radius = shader_get_uniform(shd_blur,"radius");
}

function blur_set(tex,radius)
{
	//Get texel width and height
	var _w,_h;
	_w = texture_get_texel_width(tex);
	_h = texture_get_texel_height(tex);
	
	//Apply blur to anything drawn.
	shader_set(shd_blur);
	shader_set_uniform_f(global.uni_texel,_w,_h);
	shader_set_uniform_f(global.uni_radius,radius);
}
function blur_reset()
{
	//Reset shader when finished.
	shader_reset();
}