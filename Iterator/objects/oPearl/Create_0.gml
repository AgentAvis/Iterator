// Event created by Avis.
event_inherited()

image_speed = 0

image_blend = make_color_rgb(random(255),random(255),random(255))
color_mid = merge_color(image_blend,make_color_rgb(random(255),random(255),random(255)),random(.5))
highlight_blend = merge_color(color_mid,c_white,random_range(.25,.9))

outlinestyle = choose(1,2,3)

vsp = 0
hsp = 0

icon_symbol = irandom(sprite_get_number(sGlyph_S))

//motion_set_custom(random(5),random(360))
program = "null"

relocate_mode = false

mspd = .5

drag = .995

image_blend = c_ltgray
highlight_blend = c_white 	

icon_symbol = 0

mass = random_range(.9,1.1)

col_cooldown = 0
max_col_cooldown = 30

lastcol_obj = noone;