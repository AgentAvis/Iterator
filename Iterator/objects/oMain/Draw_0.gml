/// @description Draw the simulation
if (verletSystemExists(verletSystem1)) {
	verletSystem1.draw();
	
	// Draw wireframes
	if (keyboard_check(ord("V"))) {
		verletSystem1.drawDebug();
	}
}
