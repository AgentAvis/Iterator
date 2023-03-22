// Event created by Avis.
event_inherited()

image_speed = 0

instance_create(x+sprite_height/2,y+sprite_height/2,oCan_cam)

with (instance_create(x,y,oLight_true)) {
	sprite_index = sBorder
	image_alpha = .25
}

oCamera.tarx = x + (sprite_width/2)
oCamera.tary = y + (sprite_height/2)

can_x = oCan.x+(oCan.sprite_width/2)
can_y = oCan.y+(oCan.sprite_width/2)

