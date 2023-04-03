// Event created by Avis.
event_inherited()

image_speed = 0

instance_create(x+sprite_height/2,y+sprite_height/2,oCan_cam)

can_light = instance_create(x,y,oLight_true)
with (can_light) {
	sprite_index = sBig_light
	image_alpha = .25//.125
}

oCamera.tarx = x + (sprite_width/2)
oCamera.tary = y + (sprite_height/2)

can_x = oCan.x+(oCan.sprite_width/2)
can_y = oCan.y+(oCan.sprite_width/2)

