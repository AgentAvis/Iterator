// Event created by Avis.
event_inherited()


hsp = 0
vsp = 0

mspd = 1.5 //was 3

depth -= 10

//global.focus = id

light = instance_create(x,y,oLight_true)
light.sprite_index = sGradient_true_128

desired_x = 0; //init
desired_y = 0; //init
desired_dir = 0; //init

body = 
{
    sprite : sMoon_body,
    index : 0,
    x : x,
    y : y,
    angle : image_angle,
    blend : c_white,
    alpha : image_alpha
};

head = 
{
    sprite : sMoon_head,
    index : 0,
    x : x,
    y : y,
    angle : image_angle,
    blend : c_white,
    alpha : image_alpha
};

arm1 = 
{
    sprite : sMoon_arm,
    index : 0,
    x : x,
    y : y,
    angle : image_angle,
    blend : image_blend,
    alpha : image_alpha
};

arm2 = 
{
    sprite : sMoon_arm,
    index : 0,
    x : x,
    y : y,
    angle : 0,
    blend : image_blend,
    alpha : image_alpha
};
arm_angle_offset_amt = 45/2
breathing_rate = 30