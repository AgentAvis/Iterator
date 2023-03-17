/// @description Initialize the verlet simulation

depth = 151

// Create a new verlet system
// You can create multiple systems with different physic properties
verletSystem1 = new verletSystem(0.999, 0);

rope1 = verletGroupCreateRopeTextured(verletSystem1, 190, 100, sCord, 40, 1, 10);
rope1.vertexAttachTo(first, oUmbillical_wrist_point);
rope1.vertexAttachTo(last, oUmbillical_mount_point);
rope1.vertexAttachTo(20, oUmbillical_mid_point);

rope2 = verletGroupCreateRope(verletSystem1, oPuppet.x, oPuppet.y, c_red,2,7, 15, 1, 10);
rope2.vertexAttachTo(first, oUmbillical_wrist_point);
rope2.vertexAttachTo(last, oPuppet);

rope3 = verletGroupCreateRope(verletSystem1, oPuppet.x, oPuppet.y, c_red,2,7, 10, 1, 10);
rope3.vertexAttachTo(first, oUmbillical_wrist_point);
rope3.vertexAttachTo(last, oPuppet);

rope3 = verletGroupCreateRope(verletSystem1, oPuppet.x, oPuppet.y, c_red,2,7, 10, 1, 10);
rope3.vertexAttachTo(first, oUmbillical_wrist_point);
rope3.vertexAttachTo(last, oPuppet);

rope3 = verletGroupCreateRope(verletSystem1, oPuppet.x, oPuppet.y, c_blue,2,7, 15, 1, 10);
rope3.vertexAttachTo(first, oUmbillical_wrist_point);
rope3.vertexAttachTo(last, oPuppet);

//**//		// Create verlet groups
//**//		#region Verlet ropes
//**//		// Create a new rope
//**//		rope1 = verletGroupCreateRope(verletSystem1, 190, 100, c_dkgray, 2, 4, 20, 2, 10);
//**//		
//**//		// Attach its first vertex to an object
//**//		var inst = instance_create_layer(190, 100, "Instances", oDrag);
//**//		rope1.vertexAttachTo(first, inst);
//**//		
//**//		// Attach an object to its last vertex
//**//		var inst = instance_create_layer(0, 0, "Instances", oTest);
//**//		rope1.vertexAttachObject(last, inst, vertexAttachmentType.both);
//**//		
//**//		// Create a new textured rope
//**//		// If not needed, you don't have to store it in a variable
//**//		verletGroupCreateRopeTextured(verletSystem1, 130, 100, sChainPart, 10, 10, 10);
//**//		
//**//		// Create a new textured rope and attach it's last point somewhere
//**//		// The macros 'first' and 'last' can be used to access the first and last vertex
//**//		// but you can also write any number as index in here
//**//		// Also when updating a vertex you don't have to update everything. Skip stuff with multiple ','
//**//		// By default the first point of a rope is fixed, it can be set to un-fixed the same way
//**//		// This chain has a maxTension of less then 10, it can be ripped apart
//**//		rope2 = verletGroupCreateRopeTextured(verletSystem1, 20, 160, sChainPart, 10, 1, 0.4);
//**//		rope2.vertexChangeData(last, 120, 100,, true);
//**//		
//**//		// Create a new textured with multiple attached points
//**//		rope3 = verletGroupCreateRopeTextured(verletSystem1, 200, 100, sRopePart, 30, 1, 10);
//**//		rope3.vertexChangeData(round(ds_list_size(rope1.vertexList) * 0.8), 300, 100,, true);
//**//		rope3.vertexChangeData(last, 320, 100,, true);
//**//		//rope3.active = false;		// Deactivate the simulation
//**//		//rope3.visible = false;	// Deactivate the drawing
//**//		
//**//		// Electric cables
//**//		rope4 = verletGroupCreateRope(verletSystem1, 345, 100, c_blue, 2, 20, 5, 1, 10);
//**//		rope5 = verletGroupCreateRope(verletSystem1, 350, 100, c_maroon, 2, 20, 10, 1, 10);
//**//		rope6 = verletGroupCreateRope(verletSystem1, 355, 100, c_green, 2, 20, 8, 1, 10);
//**//		var inst = instance_create_layer(0, 0, "Instances", oParticles);
//**//		inst.sprite_index = sCableEnd;
//**//		rope4.vertexAttachObject(last, inst, vertexAttachmentType.both);
//**//		var inst = instance_create_layer(0, 0, "Instances", oParticles);
//**//		inst.sprite_index = sCableEnd;
//**//		rope5.vertexAttachObject(last, inst, vertexAttachmentType.both);
//**//		var inst = instance_create_layer(0, 0, "Instances", oParticles);
//**//		inst.sprite_index = sCableEnd;
//**//		rope6.vertexAttachObject(last, inst, vertexAttachmentType.both);
//**//		#endregion
//**//		#region Verlet boxes
//**//		//verletGroupCreateBox(verletSystem1, 100, 150, 60, 60, c_maroon, 4, 1);
//**//		verletGroupCreateBoxTextured(verletSystem1, 100, 100, 28, 25, sBox, 4, 10);
//**//		verletGroupCreateBoxTextured(verletSystem1, 250, 150, 28, 25, sBox, 4, 10);
//**//		verletGroupCreateBoxTextured(verletSystem1, 200, 170, 28, 25, sBox, 4, 10);
//**//		#endregion
//**//		#region Verlet cloths
//**//		//verletGroupCreateCloth(verletSystem1, 200, 120, 20, 60, 2, c_maroon, 1, 1);
//**//		
//**//		cloth1 = verletGroupCreateClothTextured(verletSystem1, 100, 120, 20, 60, 3, sBanner, 1, 10);
//**//		var inst = instance_create_layer(110, 120, "Instances", oDrag);
//**//		cloth1.vertexAttachTo(0, inst, -10, 0);
//**//		cloth1.vertexAttachTo(5, inst, -5, 0);
//**//		cloth1.vertexAttachTo(10, inst, 0, 0);
//**//		cloth1.vertexAttachTo(15, inst, 5, 0);
//**//		cloth1.vertexAttachTo(20, inst, 10, 0);
//**//		#endregion
//**//		
//**//		// Create a force field
//**//		// Display it by holding down 'V'.
//**//		// Setting the 'useNoise' value to true is good for simulating wind
//**//		verletSystem1.addForceField(250, 120, 370, 300, 170, 0.1, true);
//**//		//verletSystem1.addForceField(200, 200, 250, 250, 180, 0.1, true);
//**//		
//**//		// Spawn custom collision objects
//**//		// For the wall collisions the object oCollisionBox is used. The objects visibility is turned off.
//**//		// These can be dragged around. Handle with care as squezing vertices between colliders can easily "blow up" the simulation.
//**//		instance_create_layer(100, 300, "Instances", oCollisionCustom);
//**//		instance_create_layer(300, 300, "Instances", oCollisionCustom);
//**//		
//**//		#region Particles
//**//		PS = part_system_create();
//**//		
//**//		partSpark = part_type_create();
//**//		part_type_sprite     (partSpark, sPartSpark, false, false, false);
//**//		part_type_life       (partSpark, 10, 60);
//**//		part_type_direction  (partSpark, 0, 0, 0, 0);
//**//		part_type_orientation(partSpark, 90, 90, 0, 0, 1);
//**//		part_type_speed      (partSpark, 2, 6, 0, 0);
//**//		part_type_size       (partSpark, 0.50, 1, 0, 0);
//**//		part_type_alpha3     (partSpark, 0.90, 1, 0);
//**//		part_type_colour3    (partSpark, make_colour_rgb(223, 113, 38), make_colour_rgb(223, 113, 38), make_colour_rgb(34, 32, 52));
//**//		part_type_blend      (partSpark, 1);
//**//		part_type_gravity    (partSpark, 0.10, 270);
//**//		#endregion


// ------------------------------------------ Functions list ------------------------------------------
/*
// Verlet system functions
verletSystem(inFrict, inGrav);	// (Constructor)
verletSystemExists(system);

system.simulate();
system.draw();
system.drawDebug();

// Verlet group functions
verletGroupExists(group);

group.vertexChangeData(index, xx, yy, radius, fixed)
group.vertexAttachObject(index, object, type, xoff, yoff)
group.vertexAttachTo(index, object, xoff, yoff)

// Create your own groups
group.vertexAdd(xx, yy, weight, radius);
group.stickAdd(v1, v2, length);

// Group templates, see how they are constructed and create your own
verletGroupCreateRope(system, xx, yy, color, width, segmentLength, segments, stiffness, maxTension);
verletGroupCreateRopeTextured(system, xx, yy, sprite, segments, stiffness, maxTension);
verletGroupCreateBox(system, xx, yy, width, height, color, stiffness, maxTension);
verletGroupCreateBoxTextured(system, xx, yy, width, height, sprite, stiffness, maxTension);
verletGroupCreateCloth(system, xx, yy, width, height, subDivisions, color, stiffness, maxTension);
verletGroupCreateClothTextured(system, xx, yy, width, height, subDivisions, sprite, stiffness, maxTension);
*/
