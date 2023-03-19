// Event created by Avis.
event_inherited()

image_speed = 0

image_blend = make_color_rgb(random(255),random(255),random(255))
color_mid = merge_color(image_blend,make_color_rgb(random(255),random(255),random(255)),random(.5))
highlight_blend = merge_color(color_mid,c_white,random_range(.25,.9))

outlinestyle = choose(1,2,3)

vsp = 0
hsp = 0

//motion_set_custom(random(5),random(360))
