// Event created by Avis.
event_inherited()

image_speed = 0

instance_create(x+sprite_height/2,y+sprite_height/2,oCan_cam)

with (instance_create(x,y,oLight_true)) {
	sprite_index = sBorder
	image_alpha = .25
}