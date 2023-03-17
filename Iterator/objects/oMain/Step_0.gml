/// @description Update the simulation

// Simulate the whole verlet system
// You can also simulate individual groups
if (verletSystemExists(verletSystem1)) verletSystem1.simulate();

if (verletSystemExists(verletSystem1)) {
	// Pause the simulation
	if (keyboard_check(vk_space)) {
		verletSystem1.active = false;
	} else {
		verletSystem1.active = true;
	}
	
	// Set the first vertexes position of the rope to the mouse position
	//rope1.vertexChangeData(first, mouse_x, mouse_y, ,);
}

// Delete a verlet group
//if (keyboard_check_pressed(ord("X"))) {
//	rope2.cleanup();
//	delete rope2;
//}

// Delete a verlet system
//if (keyboard_check_pressed(ord("C"))) {
//	verletSystem1.cleanup();
//	delete verletSystem1;
//}
