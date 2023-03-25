// Event created by Avis.
event_inherited()

//image_alpha = .125
//draw_self()


/*
mystruct =
{
    a : 10,
    b : "Hello World",
    c : int64(5),
    d : _xx + 50,
    e : function(a, b)
        {
            return a + b;
        },
    f : [ 10, 20, 30, 40, 50 ],
    g : image_index
};
*/

//image_alpha = .25


if image_angle < 0 { image_angle += 360 }

body.x = x
body.y = y
body.angle = image_angle

head_breath_sway_sin = (sin(oDj.timestep/breathing_rate)/2)

head_offset_dis = 5 + head_breath_sway_sin //base offset + breathing sin
head_offset_angle = body.angle
head.x = x + lengthdir_x(head_offset_dis,head_offset_angle)
head.y = y + lengthdir_y(head_offset_dis,head_offset_angle)
head.wire.x = x + lengthdir_x(head_offset_dis+((sprite_get_width(head.sprite)/2)-1),head_offset_angle)
head.wire.y = y + lengthdir_y(head_offset_dis+((sprite_get_width(head.sprite)/2)-1),head_offset_angle)
head.angle = body.angle

arm_sway_sin = sin(oDj.timestep/breathing_rate)*2.5

arm_angle_offset_amt_val = arm_angle_offset_amt+arm_sway_sin 
if (body.angle mod 360) > 180 { arm_angle_offset_amt_val*= -1 }

//draw_text(x,y,string(body.angle mod 360))

arm1_height_offset_dis = head_offset_dis - 1
arm1_width_offset_dis = 4
arm1.x = x + lengthdir_x(arm1_height_offset_dis,body.angle) + lengthdir_x(arm1_width_offset_dis,body.angle+90)
arm1.y = y + lengthdir_y(arm1_height_offset_dis,body.angle) + lengthdir_y(arm1_width_offset_dis,body.angle+90)
arm1.angle = angle_lerp(arm1.angle,(270-arm_angle_offset_amt_val),.1)//-body.angle//+90

arm2_height_offset_dis = head_offset_dis - 1
arm2_width_offset_dis = 6
arm2.x = x + lengthdir_x(arm2_height_offset_dis,body.angle) + lengthdir_x(arm2_width_offset_dis,body.angle-90)
arm2.y = y + lengthdir_y(arm2_height_offset_dis,body.angle) + lengthdir_y(arm2_width_offset_dis,body.angle-90)
arm2.angle = angle_lerp(arm2.angle,(270+arm_angle_offset_amt_val),.1)//-body.angle//-90

//draw_text(x,y,string(270+arm_angle_offset_amt_val))

draw_sprite_ext(body.sprite,body.index,body.x,body.y,image_xscale,image_yscale,body.angle,body.blend,body.alpha*image_alpha)
draw_sprite_ext(sMoon_robe,body.index,body.x,body.y,image_xscale,image_yscale,body.angle,body.blend,body.alpha*image_alpha*robe_trans_alpha)

draw_sprite_ext(head.sprite,head.index,head.x,head.y,image_xscale,image_yscale,head.angle,head.blend,head.alpha*image_alpha)

draw_sprite_ext(arm1.sprite,arm1.index,arm1.x,arm1.y,image_xscale,image_yscale,arm1.angle,arm1.blend,arm1.alpha*image_alpha)
draw_sprite_ext(sMoon_sleeve,arm1.index,arm1.x,arm1.y,image_xscale,-image_yscale,arm1.angle,arm1.blend,arm1.alpha*image_alpha*robe_trans_alpha)

draw_sprite_ext(arm2.sprite,arm2.index,arm2.x,arm2.y,image_xscale,image_yscale,arm2.angle,arm2.blend,arm2.alpha*image_alpha)
draw_sprite_ext(sMoon_sleeve,arm2.index,arm2.x,arm2.y,image_xscale,image_yscale,arm2.angle,arm2.blend,arm2.alpha*image_alpha*robe_trans_alpha)

//draw_circle(desired_x,desired_y,2,false)