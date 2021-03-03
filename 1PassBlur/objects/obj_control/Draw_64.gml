///@desc Draw blur + helicopter

//Apply the blur to the application surface.
var _tex = surface_get_texture(application_surface);
blur_set(_tex,radius);
draw_surface(application_surface,0,0);
blur_reset();

//Draw the helicopter on top.
draw_sprite_ext(spr_helicopter,abs(pos+y/9)/3,x,y,10,10,-5-hspeed,-1,1);

#region Draw tip box
if tip
{
	var t = "The Dual-Kawase filter is cheap way to do a high-radius blur."+
	"\nClick anywhere or press space to change blur radius."+
	"\nBlur radius: "+string(radius);
	draw_set_color(0);
	draw_set_alpha(.2);
	draw_rectangle(0,0,640,100,0);
	draw_rectangle(0,0,640,100,1);
	
	draw_set_alpha(1);
	draw_text(14,16,t);
	draw_text(18,16,t);
	draw_text(16,14,t);
	draw_text(16,18,t);
	draw_set_color(-1);
	draw_text(16,16,t);
	
	draw_set_color(merge_color($ffffff,$8888ee,hover));
	
	var r = 14+4*hover;
	draw_line_width(640-32-r,32-r,640-32+r,32+r,6);
	draw_line_width(640-32+r,32-r,640-32-r,32+r,6);

}
#endregion