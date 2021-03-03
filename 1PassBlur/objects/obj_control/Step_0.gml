///@desc Blur + movement

//Update blur radius.
var _scroll = mouse_wheel_down()-mouse_wheel_up();
_scroll += 4*mouse_check_button_pressed(mb_left);
scroll = scroll*.9+.1*_scroll;
radius = clamp(radius+2*scroll,1,32);

//Scroll to the right.
pos--;

//Move the helicopter.
hspeed = hspeed*.9+.01*(640-360*dcos(pos*.6)-x);
vspeed = vspeed*.9+.01*(360-160*dsin(pos)-y);

//Update tip ui values.
hover = hover*.7+.3*point_in_circle(mouse_x,mouse_y,640-32,32,32)*tip;
window_set_cursor(hover>.8? cr_handpoint: cr_default);
tip *= !(mouse_check_button_pressed(mb_left) && hover>.7);