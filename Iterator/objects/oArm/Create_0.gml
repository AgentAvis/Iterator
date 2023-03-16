/// @desc initialise chain
chain = ik_create_chain();

ik_chain_add_segment(chain,169,116);
ik_chain_add_segment(chain,93,39);
ik_chain_add_segment(chain,39,39);

sum = 162+112+85+34+34+34 //153 not 53
//ik_chain_add_segment(chain,40,30);

cart_angle = 0
dcart_angle = 0
angle_speed = 0

d_desired_angle = 0
desired_angle = 0

cart = instance_create(x,y,oCart)
cart.depth = 001

//depth = oLighting.depth + 50

depth = 160