// Event created by Avis.
event_inherited()

spd_image_xscale = 0

image_speed = 0
frame_change = false
	
	
x = oCan.can_x //- (sprite_width/2)
y = oCan.can_y //- (sprite_height/2)

Puppet_frame_x = x+65
Puppet_frame_y = y+65

spr_wid = -65
color_picker = false

color_picker_x = x;
color_picker_y = y;

collect_color = false;

instance_create(x,y,oColor_picker_forground)

draw_color_cursor = false

color_x = 0;
color_y = 0;

selected_col = make_color_hsv(random(255),random(255),random_range(100,255));
set_body_color(selected_col)

color_picker_xoff = 0

color_picker_value = 1
color_picker_transparency = 1

is_sliding_1 = false





