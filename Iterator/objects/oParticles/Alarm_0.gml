/// @description Spawn particles in the objects direction
repeat(irandom_range(1, 8)) {
	var a = random_range(image_angle - 25, image_angle + 25);
	part_type_direction(oMain.partSpark, a, a, 0, 0);
	part_particles_create(oMain.PS, x + lengthdir_x(6, a), y + lengthdir_y(6, a), oMain.partSpark, 1);
}

alarm[0] = random(room_speed * 2) + 1;