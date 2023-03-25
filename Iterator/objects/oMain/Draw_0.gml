/// @description Draw the simulation
if (verletSystemExists(verletSystem1)) and oArm.image_alpha != 0 {
	verletSystem1.draw();
	
	// Draw wireframes
	if (keyboard_check(ord("V"))) {
		verletSystem1.drawDebug();
	}
}
