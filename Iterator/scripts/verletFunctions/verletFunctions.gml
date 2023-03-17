#region Verlet system functions
/// @function					verletSystem(inFrict, inGrav);
/// @param {float} [inFrict]	The friction.
/// @param {float} [inGrav]		The gravity.
/// @description				The verlet system constructor.
function verletSystem(inFrict, inGrav) constructor {
	verletGroups = ds_list_create();
	forceFields = ds_list_create();
	
	frict = 0;
	grav = 0;
	if (inFrict != undefined) frict = inFrict;
	if (inGrav != undefined) grav = inGrav;
	
	active = true;
	visible = true;
	
	/// @function					simulate();
	/// @description				Simulates the verlet system.
	simulate = function() {
		if (active) {
			var verletGroupAmount = ds_list_size(verletGroups);
			var currentGroup;
			
			for (var i = 0; i < verletGroupAmount; i++) {
				currentGroup = verletGroups[| i];
				
				if (currentGroup.active) {
					currentGroup.simulate(frict, grav);
				}
			}
		}
	};
	
	/// @function					addForceField(inX1, inY1, inX2, inY2, inDir, inStr, inUseNoise);
	/// @param {float} inX1			The force fields left position.
	/// @param {float} inY1			The force fields top position.
	/// @param {float} inX2			The force fields right position.
	/// @param {float} inY2			The force fields bottom position.
	/// @param {float} inDir		The force fields direction.
	/// @param {float} inStr		The force fields strength.
	/// @param {float} inUseNoise	Whether the force field should use noise or a constant force.
	/// @description				Adds a force field to the system.
	addForceField = function(inX1, inY1, inX2, inY2, inDir, inStr, inUseNoise) {
		ds_list_add(forceFields, new forceField(inX1, inY1, inX2, inY2, inDir, inStr, inUseNoise));	
	};
	
	/// @function		draw();
	/// @description	Draws the verlet system.
	draw = function() {
		if (visible) {
			var verletGroupAmount = ds_list_size(verletGroups);
			var currentGroup;
		
			for (var i = 0; i < verletGroupAmount; i++) {
				currentGroup = verletGroups[| i];
			
				if (currentGroup.visible) {
					currentGroup.draw();
				}
			}
		}
	};
	
	/// @function		drawDebug();
	/// @description	Draws the verlet system with wireframe mode.
	drawDebug = function() {
		// Draw verlet groups
		var verletGroupAmount = ds_list_size(verletGroups);
		var currentGroup;
		
		for (var i = 0; i < verletGroupAmount; i++) {
			currentGroup = verletGroups[| i];
			
			if (currentGroup.visible) {
				currentGroup.drawWireframe();
			}
		}
		
		// Draw force fields
		var forceFieldAmount = ds_list_size(forceFields);
		var currentForceField, cx, cy, len, s;
		
		for (var i = 0; i < forceFieldAmount; i++) {
			currentForceField = forceFields[| i];
			
			draw_rectangle(currentForceField.x1, currentForceField.y1, currentForceField.x2, currentForceField.y2, true);
			
			cx = currentForceField.x1 + (currentForceField.x2 - currentForceField.x1) * 0.5;
			cy = currentForceField.y1 + (currentForceField.y2 - currentForceField.y1) * 0.5;
			len = 10;
			s = 4;
			draw_arrow(cx + lengthdir_x(len, currentForceField.dir + 180), cy + lengthdir_y(len, currentForceField.dir + 180), cx + lengthdir_x(len, currentForceField.dir), cy + lengthdir_y(len, currentForceField.dir), s);
		}
	};
	
	/// @function		cleanup();
	/// @description	Destroys data structures, frees memory.
	cleanup = function() {
		if (!ds_list_empty(verletGroups)) {
			var currentGroup;
			repeat (ds_list_size(verletGroups)) {
				currentGroup = verletGroups[| 0];
				if (verletGroupExists(currentGroup)) {
					currentGroup.cleanup();
					delete verletGroups[| 0];
				}
				ds_list_delete(verletGroups, 0);
			}
		}
		
		if (ds_exists(verletGroups, ds_type_list)) ds_list_destroy(verletGroups);
		if (ds_exists(forceFields, ds_type_list)) ds_list_destroy(forceFields);
	};
};

/// @function				verletSystemExists(system);
/// @param {struct} system	The verlet system to check.
/// @description			Checks if a variable holds a verlet system.
function verletSystemExists(system) {
	return is_struct(system);
};
#endregion
#region Verlet group base functions
/// @function			verletGroup();
/// @description		The verlet group constructor.
function verletGroup() constructor {
	active = true;
	visible = true;
	type = undefined;
	stiffness = 1;
	maxTension = 10; // 10 = can't rip, lower value = easier to rip apart
	aliveCounter = 0; // Used to prevent ripping structures on spawn
	spawnRipDelaySeconds = 2; // "
	system = noone;
	
	vertexList = ds_list_create();
	stickList = ds_list_create();
	attachmentList = ds_list_create();
	
	/// @function				vertexAdd(xx, yy, weight, radius);
	/// @param {float} xx		The new vertex x position.
	/// @param {float} yy		The new vertex y position.
	/// @param {float} weight	The new vertex weigth.
	/// @param {float} radius	The new vertex radius.
	/// @description			Adds a new vertex to the vertex list.
	vertexAdd = function(xx, yy, weight, radius) {
		ds_list_add(vertexList, new vertex(xx, yy, weight, radius));
	};
	
	/// @function				vertexChangeData(index, xx, yy, radius, fixed);
	/// @param {int} index		The index of the vertex which should be updated.
	/// @param {float} [xx]		The new vertex x position.
	/// @param {float} [yy]		The new vertex y position.
	/// @param {float} [radius]	The new vertex radius.
	/// @param {float} [fixed]	Whether the vertex position should be fixed or not.
	/// @description			Changes the data of a vertex.
	vertexChangeData = function(index, xx, yy, radius, fixed) {
		if (index == first) {
			index = 0;
		} else if (index == last) {
			index = ds_list_size(vertexList) - 1;
		}
		
		var thisVertex = vertexList[| index];
		if (xx != undefined) thisVertex.x = xx;
		if (yy != undefined) thisVertex.y = yy;
		if (radius != undefined) thisVertex.radius = radius;
		if (fixed != undefined) thisVertex.fixed = fixed;
	};
	
	/// @function				vertexAttachObject(index, object, type, xoff, yoff);
	/// @param {float} index	The index of the vertex.
	/// @param {float} object	The object to attach.
	/// @param {int} type		Whether the attached object should copy the position, rotation or both.
	/// @param {float} [xoff]	The x offset.
	/// @param {float} [yoff]	The y offset.
	/// @description			Attaches an object to a vertex.
	vertexAttachObject = function(index, object, type, xoff, yoff) {
		if (index == first) {
			index = 0;
		} else if (index == last) {
			index = ds_list_size(vertexList) - 1;
		}
		if (xoff == undefined) xoff = 0;
		if (yoff == undefined) yoff = 0;
		
		ds_list_add(attachmentList, new attachment(index, object, type, 0, xoff, yoff));
	};
	
	/// @function				vertexAttachTo(index, object, xoff, yoff);
	/// @param {float} index	The index of the vertex to attach.
	/// @param {float} object	The object.
	/// @param {float} [xoff]	The x offset.
	/// @param {float} [yoff]	The y offset.
	/// @description			Attaches a vertex to an object.
	vertexAttachTo = function(index, object, xoff, yoff) {
		if (index == first) {
			index = 0;
		} else if (index == last) {
			index = ds_list_size(vertexList) - 1;
		}
		if (xoff == undefined) xoff = 0;
		if (yoff == undefined) yoff = 0;
		
		ds_list_add(attachmentList, new attachment(index, object, 0, 1, xoff, yoff));
	};
	
	/// @function				stickAdd(v1, v2, length);
	/// @param {struct} v1		The sticks first vertex.
	/// @param {struct} v2		The sticks second vertex.
	/// @param {int} length		The sticks length.
	/// @description			Adds a new stick to the stick list.
	stickAdd = function(v1, v2, length) {
		ds_list_add(stickList, new stick(v1, v2, length));
	};
	
	/// @function					simulate(frict, grav);
	/// @param {float} frict		The friction.
	/// @param {float} grav			The gravity.
	/// @description				Simulates the verlet group.
	simulate = function(frict, grav) {
		#region Update vertices
		var vertexAmount = ds_list_size(vertexList);
		var currentVertex, vx, vy;
		
		for (var i = 0; i < vertexAmount; i++) {
			currentVertex = vertexList[| i];
			
			if (!currentVertex.fixed) {
				vx = (currentVertex.x - currentVertex.xLast) * frict;
				vy = (currentVertex.y - currentVertex.yLast) * frict;
				currentVertex.xLast = currentVertex.x;
				currentVertex.yLast = currentVertex.y;
				currentVertex.x += vx;
				currentVertex.y += vy;
				
				if (!collide(currentVertex.x, currentVertex.y, currentVertex.radius)) currentVertex.y += grav * currentVertex.weight;
			}
		}
		#endregion
		#region Handle attachments
		var attachmentAmount = ds_list_size(attachmentList);
		var currentAttachment;
		
		for (var i = 0; i < attachmentAmount; i++) {
			currentAttachment = attachmentList[| i];
			
			if (currentAttachment.hierarchy == 0) {
				// Object attached to vertex
				if (currentAttachment.type != vertexAttachmentType.rotationOnly) {
					currentAttachment.object.x = vertexList[| currentAttachment.index].x + currentAttachment.xoff;
					currentAttachment.object.y = vertexList[| currentAttachment.index].y + currentAttachment.yoff;
				}
				if (currentAttachment.type != vertexAttachmentType.positionOnly) {
					if (currentAttachment.index == 0) {
						currentAttachment.object.image_angle = 0;
					} else {
						currentAttachment.object.image_angle = point_direction(vertexList[| currentAttachment.index - 1].x, vertexList[| currentAttachment.index - 1].y, vertexList[| currentAttachment.index].x, vertexList[| currentAttachment.index].y);
					}
				}
			} else {
				// Vertex attached to object
				vertexList[| currentAttachment.index].x = currentAttachment.object.x + currentAttachment.xoff;
				vertexList[| currentAttachment.index].y = currentAttachment.object.y + currentAttachment.yoff;
			}
		}
		#endregion
		#region Handle force fields
		if (system != noone) {
			var forceFieldAmount = ds_list_size(system.forceFields);
			var vertexAmount = ds_list_size(vertexList);
			var currentForceField, currentVertex, dir, str;
			
			for (var i = 0; i < forceFieldAmount; i++) {
				currentForceField = system.forceFields[| i];
				dir = currentForceField.dir + 180;
				str = currentForceField.str;
				if (currentForceField.useNoise) {
					str *= sin(2 * current_time) + sin(pi * current_time);
				}
				
				for (var j = 0; j < vertexAmount; j++) {
					currentVertex = vertexList[| j];
					if (point_in_rectangle(currentVertex.x, currentVertex.y, currentForceField.x1, currentForceField.y1, currentForceField.x2, currentForceField.y2)) {
						currentVertex.xLast += lengthdir_x(str, dir);
						currentVertex.yLast += lengthdir_y(str, dir);
					}
				}
			}
		}
		#endregion
		
		repeat (stiffness) {
			#region Update sticks
			var stickAmount = ds_list_size(stickList);
			var currentStick;
			
			for (var i = 0; i < stickAmount; i++) {
				currentStick = stickList[| i];
				
				var dx = currentStick.v1.x - currentStick.v2.x;
				var dy = currentStick.v1.y - currentStick.v2.y;
				var dist = sqrt(dx * dx + dy * dy);
				var difference = currentStick.length - dist;
				var percent = difference / dist * 0.5;
				var offsetX = dx * percent;
				var offsetY = dy * percent;
				
				// Rip connections
				if (aliveCounter >= room_speed * spawnRipDelaySeconds && maxTension < 10 && abs(percent) > maxTension && !currentStick.v1.fixed && !currentStick.v2.fixed) {
					ds_list_delete(stickList, i);
					i --;
					stickAmount --;
					continue;
				}
				
				if (currentStick.v1.fixed) {
					if (!currentStick.v2.fixed) {
						currentStick.v2.x -= offsetX * 2;
						currentStick.v2.y -= offsetY * 2;
					}
				} else {
					if (currentStick.v2.fixed) {
						currentStick.v1.x += offsetX * 2;
						currentStick.v1.y += offsetY * 2;
					} else {
						currentStick.v1.x += offsetX;
						currentStick.v1.y += offsetY;
						currentStick.v2.x -= offsetX;
						currentStick.v2.y -= offsetY;
					}
				}
			}
			#endregion
			#region Constrain vertices
			var vertexAmount = ds_list_size(vertexList);
			var currentVertex, vx, vy;
			
			for (var i = 0; i < vertexAmount; i++) {
				currentVertex = vertexList[| i];
				
				if (!currentVertex.fixed) {
					vx = (currentVertex.x - currentVertex.xLast) * frict;
					vy = (currentVertex.y - currentVertex.yLast) * frict;
					
					var inst = collide(currentVertex.x, currentVertex.y, currentVertex.radius);
					
					if (inst != noone) {
						if (inst.type == collisionType.box) {
							// The box collision type avoids vertices moving around on the floor
							var dir = 0;
							if (currentVertex.yLast < inst.bbox_top) {
								dir = 90;
							} else if (currentVertex.yLast > inst.bbox_bottom) {
								dir = 270;
							} else if (currentVertex.xLast < inst.bbox_left) {
								dir = 180;
							} else if (currentVertex.xLast > inst.bbox_right) {
								dir = 0;
							}
						} else {
							// Works for custom collision masks
							var dir = point_direction(inst.x, inst.y, currentVertex.x, currentVertex.y);
						}
						
						// Move outside wall
						while (collide(currentVertex.x, currentVertex.y, currentVertex.radius)) {
							currentVertex.x += lengthdir_x(1, dir);
							currentVertex.y += lengthdir_y(1, dir);
						}
						
						// Move as close back to the wall as possible to stabilize vertices
						var prec = 0.1;
						while (!collide(currentVertex.x + lengthdir_x(prec, dir + 180), currentVertex.y + lengthdir_y(prec, dir + 180), currentVertex.radius)) {
							currentVertex.x += lengthdir_x(prec, dir + 180);
							currentVertex.y += lengthdir_y(prec, dir + 180);
						}
						
						currentVertex.xLast = currentVertex.x;
						currentVertex.yLast = currentVertex.y;
					}
				}
			}
			#endregion
		}
		if (aliveCounter <= room_speed * spawnRipDelaySeconds) aliveCounter ++;
	};
	
	/// @function		drawWireframe();
	/// @description	Debug drawing, draws the group in wireframe mode
	drawWireframe = function() {
		var vertexAmount = ds_list_size(vertexList);
		var stickAmount = ds_list_size(stickList);
		var currentVertex, currentStick;
		
		// Draw sticks
		draw_set_color(c_gray);
		for (var i = 0; i < stickAmount; i++) {
			currentStick = stickList[| i];
			draw_line_width(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y, 1);
			
			//var swHalf = sprite_get_width(sprite) * 0.5;
			//var yoff = sprite_get_yoffset(sprite);
			//var stickDir = point_direction(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y);
			
			//draw_circle(currentStick.v1.x + lengthdir_x(swHalf, stickDir - 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir - 90) + lengthdir_y(yoff, stickDir + 180), 1, false);
			//draw_circle(currentStick.v1.x + lengthdir_x(swHalf, stickDir + 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir + 90) + lengthdir_y(yoff, stickDir + 180), 1, false);
			//draw_circle(currentStick.v2.x + lengthdir_x(swHalf, stickDir - 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir - 90),  1, false);
			//draw_circle(currentStick.v2.x + lengthdir_x(swHalf, stickDir + 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir + 90),  1, false);
		}
		
		// Draw vertices
		draw_set_color(c_white);
		for (var i = 0; i < vertexAmount; i++) {
			currentVertex = vertexList[| i];
			draw_circle(currentVertex.x, currentVertex.y, 1, false);
		}
	};
	
	/// @function		draw();
	/// @description	The normal drawing function. Gets replaced in the verletGroupCreate() functions;
	draw = drawWireframe;
	
	/// @function		cleanup();
	/// @description	Destroys data structures, frees memory.
	cleanup = function() {
		if (system != noone && verletSystemExists(system)) {
			var verletGroupAmount = ds_list_size(system.verletGroups);
			for (var i = 0; i < verletGroupAmount; i++) {
				if (system.verletGroups[| i] == self) {
					ds_list_delete(system.verletGroups, i);
					break;
				}
			}
		}
		
		if (ds_exists(vertexList, ds_type_list)) ds_list_destroy(vertexList);
		if (ds_exists(stickList, ds_type_list)) ds_list_destroy(stickList);
		if (ds_exists(attachmentList, ds_type_list)) ds_list_destroy(attachmentList);
	};
};

/// @function				verletGroupExists(group);
/// @param {struct} group	The verlet group to check.
/// @description			Checks if a variable holds a verlet group.
function verletGroupExists(group) {
	return is_struct(group);
};
#endregion
#region Verlet group templates
/// @function					verletGroupCreateRope(system, xx, yy, color, width, segmentLength, segments, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {floth} xx			The ropes x position.
/// @param {floth} yy			The ropes y position.
/// @param {int} color			The ropes color.
/// @param {int} width			The ropes width.
/// @param {int} segmentLength	The length of a rope segment.
/// @param {int} segments		The amount of rope segments.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new rope.
function verletGroupCreateRope(system, xx, yy, color, width, segmentLength, segments, stiffness, maxTension) {
	var newGroup = new verletGroup();
	newGroup.color = color;
	newGroup.width = width;
	newGroup.stiffness = stiffness;
	newGroup.maxTension = maxTension;
	
	with (newGroup) {
		// Create vertices
		for (var i = 0; i < segments + 1; i++) {
			vertexAdd(xx, yy + i * segmentLength, 1, width / 2);
		}
		// Create sticks
		for (var i = 1; i < segments + 1; i++) {
			stickAdd(vertexList[| i - 1], vertexList[| i], segmentLength);
		}
		
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a textured rope
		draw = function() {
			var stickAmount = ds_list_size(stickList);
			var currentStick, stickDir;
			
			var wHalf = width * 0.5;
			
			draw_set_color(color);
			draw_primitive_begin(pr_trianglestrip);
			for (var i = 0; i < stickAmount; i++) {
				currentStick = stickList[| i];
				stickDir = point_direction(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y);
				draw_vertex(currentStick.v1.x + lengthdir_x(wHalf, stickDir - 90), currentStick.v1.y + lengthdir_y(wHalf, stickDir - 90));
				draw_vertex(currentStick.v1.x + lengthdir_x(wHalf, stickDir + 90), currentStick.v1.y + lengthdir_y(wHalf, stickDir + 90));
			}
			draw_vertex(currentStick.v2.x + lengthdir_x(wHalf, stickDir - 90), currentStick.v2.y + lengthdir_y(wHalf, stickDir - 90));
			draw_vertex(currentStick.v2.x + lengthdir_x(wHalf, stickDir + 90), currentStick.v2.y + lengthdir_y(wHalf, stickDir + 90));
			draw_primitive_end();
			draw_set_color(c_white);
		};
	}
	
	// Fix the first point of the rope
	newGroup.vertexChangeData(first,,,, true);
	
	// Add the group to the system
	if (system != undefined) {
		if (verletSystemExists(system)) {
			newGroup.system = system;
			ds_list_add(system.verletGroups, newGroup);
		}
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};

/// @function					verletGroupCreateRopeTextured(system, xx, yy, sprite, segments, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {float} xx			The ropes x position.
/// @param {float} yy			The ropes y position.
/// @param {sprite} sprite		The sprite texture to use.
/// @param {int} segments		The amount of rope segments.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new textured rope.
function verletGroupCreateRopeTextured(system, xx, yy, sprite, segments, stiffness, maxTension) {
	var newGroup = new verletGroup();
	newGroup.sprite = sprite;
	newGroup.stiffness = stiffness;
	newGroup.maxTension = maxTension;
	
	with (newGroup) {
		// Create the vertices and sticks
		var segmentLength = sprite_get_height(sprite) - sprite_get_yoffset(sprite);
		// Create vertices
		for (var i = 0; i < segments + 1; i++) {
			vertexAdd(xx, yy + i * segmentLength, 1, sprite_get_width(sprite) / 2);
		}
		// Create sticks
		for (var i = 1; i < segments + 1; i++) {
			stickAdd(vertexList[| i - 1], vertexList[| i], segmentLength);
		}
		
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a textured rope
		draw = function() {
			var stickAmount = ds_list_size(stickList);
			var currentStick, stickDir;
			
			var texture = sprite_get_texture(sprite, 0);
			var swHalf = sprite_get_width(sprite) * 0.5;
			var yoff = sprite_get_yoffset(sprite);
			
			// Draw the texture instead of sticks
			for (var i = 0; i < stickAmount; i++) {
				currentStick = stickList[| i];
				stickDir = point_direction(currentStick.v1.x, currentStick.v1.y, currentStick.v2.x, currentStick.v2.y);
				
				draw_primitive_begin_texture(pr_trianglestrip, texture);
				draw_vertex_texture(currentStick.v1.x + lengthdir_x(swHalf, stickDir - 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir - 90) + lengthdir_y(yoff, stickDir + 180), 0, 0);
				draw_vertex_texture(currentStick.v1.x + lengthdir_x(swHalf, stickDir + 90) + lengthdir_x(yoff, stickDir + 180), currentStick.v1.y + lengthdir_y(swHalf, stickDir + 90) + lengthdir_y(yoff, stickDir + 180), 1, 0);
				draw_vertex_texture(currentStick.v2.x + lengthdir_x(swHalf, stickDir - 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir - 90), 0, 1);
				draw_vertex_texture(currentStick.v2.x + lengthdir_x(swHalf, stickDir + 90), currentStick.v2.y + lengthdir_y(swHalf, stickDir + 90), 1, 1);
				draw_primitive_end();
			}
		};
	}
	
	// Fix the first point of the rope
	newGroup.vertexChangeData(first,,,, true);
	
	// Add the group to the system
	if (system != undefined) {
		if (verletSystemExists(system)) {
			newGroup.system = system;
			ds_list_add(system.verletGroups, newGroup);
		}
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};

/// @function					verletGroupCreateBox(system, xx, yy, width, height, color, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {float} xx			The boxes left x position.
/// @param {float} yy			The boxes top y position.
/// @param {int} width			The boxes width.
/// @param {int} height			The boxes height.
/// @param {int} color			The boxes color.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new  box.
function verletGroupCreateBox(system, xx, yy, width, height, color, stiffness, maxTension) {
	var newGroup = new verletGroup();
	newGroup.color = color;
	newGroup.stiffness = stiffness;
	newGroup.maxTension = maxTension;
	
	with (newGroup) {
		// Create vertices
		vertexAdd(xx, yy, 1, 1);
		vertexAdd(xx + width, yy, 1, 1);
		vertexAdd(xx, yy + height, 1, 1);
		vertexAdd(xx + width, yy + height, 1, 1);
		
		// Create sticks
		stickAdd(vertexList[| 0], vertexList[| 1], width);
		stickAdd(vertexList[| 2], vertexList[| 3], width);
		stickAdd(vertexList[| 0], vertexList[| 2], height);
		stickAdd(vertexList[| 1], vertexList[| 3], height);
		stickAdd(vertexList[| 0], vertexList[| 3], sqrt(sqr(width) + sqr(height))); // Cross stick to stabilize the box
		
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a colored box
		draw = function() {
			var v1, v2, v3, v4;
			
			draw_set_color(color);
			draw_primitive_begin(pr_trianglestrip);
			v1 = vertexList[| 0];
			v2 = vertexList[| 1];
			v3 = vertexList[| 2];
			v4 = vertexList[| 3];
			
			draw_vertex(v1.x, v1.y);
			draw_vertex(v2.x, v2.y);
			draw_vertex(v3.x, v3.y);
			draw_vertex(v4.x, v4.y);
			draw_primitive_end();
			draw_set_color(c_white);
		};
	}
	
	// Add the group to the system
	if (system != undefined) {
		if (verletSystemExists(system)) {
			newGroup.system = system;
			ds_list_add(system.verletGroups, newGroup);
		}
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};

/// @function					verletGroupCreateBoxTextured(system, xx, yy, width, height, sprite, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {float} xx			The boxes left x position.
/// @param {float} yy			The boxes top y position.
/// @param {int} width			The boxes width.
/// @param {int} height			The boxes height.
/// @param {int} sprite			The boxes sprite.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new textured box.
function verletGroupCreateBoxTextured(system, xx, yy, width, height, sprite, stiffness, maxTension) {
	var newGroup = verletGroupCreateBox(system, xx, yy, width, height, c_white, stiffness, maxTension);
	newGroup.sprite = sprite;
	
	with (newGroup) {
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a colored box
		draw = function() {
			var v1, v2, v3, v4;
			var texture = sprite_get_texture(sprite, 0);
			
			draw_set_color(color);
			draw_primitive_begin_texture(pr_trianglestrip, texture);
			v1 = vertexList[| 0];
			v2 = vertexList[| 1];
			v3 = vertexList[| 2];
			v4 = vertexList[| 3];
			
			draw_vertex_texture(v1.x, v1.y, 0, 0);
			draw_vertex_texture(v2.x, v2.y, 1, 0);
			draw_vertex_texture(v3.x, v3.y, 0, 1);
			draw_vertex_texture(v4.x, v4.y, 1, 1);
			draw_primitive_end();
			draw_set_color(c_white);
		};
	}
	
	// Add the group to the system
	if (system != undefined) {
		if (verletSystemExists(system)) {
			newGroup.system = system;
			ds_list_add(system.verletGroups, newGroup);
		}
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};

/// @function					verletGroupCreateCloth(system, xx, yy, width, height, subDivisions, color, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {float} xx			The cloth's left x position.
/// @param {float} yy			The cloth's top y position.
/// @param {int} width			The cloth's width.
/// @param {int} height			The cloth's height.
/// @param {int} subDivisions	How many times the mesh gets divided. Also called mesh detail.
/// @param {int} color			The cloth's color.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new cloth mesh.
function verletGroupCreateCloth(system, xx, yy, width, height, subDivisions, color, stiffness, maxTension) {
	var newGroup = new verletGroup();
	newGroup.color = color;
	newGroup.stiffness = stiffness;
	newGroup.maxTension = maxTension;
	newGroup.subDivisions = subDivisions;
	
	with (newGroup) {
		// Create vertices
		var segmentWidth = width / (1 + subDivisions);
		var segmentHeight = height / (1 + subDivisions);
		
		for (var i = 0; i < 2 + subDivisions; i++) {
			for (var j = 0; j < 2 + subDivisions; j++) {
				vertexAdd(xx + i * segmentWidth, yy + j * segmentHeight, 1, 1);
			}
		}
		
		// Create sticks
		for (var i = 0; i < 2 + subDivisions; i++) {
			for (var j = 0; j < 2 + subDivisions; j++) {
				if (i > 0) stickAdd(vertexList[| i - 1 + j * (2 + subDivisions)], vertexList[| i + j * (2 + subDivisions)], segmentHeight);
				if (j > 0) stickAdd(vertexList[| i + (j - 1) * (2 + subDivisions)], vertexList[| i + j * (2 + subDivisions)], segmentWidth);
			}
		}
		
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a colored cloth
		draw = function() {
			var v1, v2, v3, v4;
			
			draw_set_color(color);
			draw_primitive_begin(pr_trianglestrip);
			for (var i = 0; i < 1 + subDivisions; i++) {
				for (var j = 1; j < 2 + subDivisions; j++) {
					v1 = vertexList[| i * (2 + subDivisions) + j - 1];
					v2 = vertexList[| (i + 1) * (2 + subDivisions) + j - 1];
					v3 = vertexList[| i * (2 + subDivisions) + j];
					v4 = vertexList[| (i + 1) * (2 + subDivisions) + j];
					
					draw_vertex(v1.x, v1.y);
					draw_vertex(v2.x, v2.y);
					draw_vertex(v3.x, v3.y);
					draw_vertex(v4.x, v4.y);
				}
			}
			draw_primitive_end();
			draw_set_color(c_white);
		};
	}
	
	// Fix the top rows points
	for (var i = 0; i < 2 + subDivisions; i++) newGroup.vertexChangeData(i * (2 + subDivisions),,,, true);
	
	// Add the group to the system
	if (system != undefined) {
		if (verletSystemExists(system)) {
			newGroup.system = system;
			ds_list_add(system.verletGroups, newGroup);
		}
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};

/// @function					verletGroupCreateClothTextured(system, xx, yy, width, height, subDivisions, sprite, stiffness, maxTension);
/// @param {struct} [system]	The system in which to create the group.
/// @param {float} xx			The cloth's left x position.
/// @param {float} yy			The cloth's top y position.
/// @param {int} width			The cloth's width.
/// @param {int} height			The cloth's height.
/// @param {int} subDivisions	How many times the mesh gets divided. Also called mesh detail.
/// @param {int} sprite			The cloth's sprite.
/// @param {int} stiffness		The stiffness of the sticks. Higher stiffness can decrease performance a lot!
/// @param {float} maxTension	The max tension of a stick before it rips apart (0-1); Set it to 10 if you don't want it to rip.
/// @description				Creates a new cloth mesh.
function verletGroupCreateClothTextured(system, xx, yy, width, height, subDivisions, sprite, stiffness, maxTension) {
	// Create a regular cloth and change its drawing function
	var newGroup = verletGroupCreateCloth(system, xx, yy, width, height, subDivisions, c_white, stiffness, maxTension)
	newGroup.sprite = sprite;
	
	with (newGroup) {
		// Override the drawing function
		/// @function		draw();
		/// @description	Draws a textured cloth
		draw = function() {
			var v1, v2, v3, v4;
			
			var texture = sprite_get_texture(sprite, 0);
			for (var i = 0; i < 1 + subDivisions; i++) {
				draw_primitive_begin_texture(pr_trianglestrip, texture);
				for (var j = 1; j < 2 + subDivisions; j++) {
					v1 = vertexList[| i * (2 + subDivisions) + j - 1];
					v2 = vertexList[| (i + 1) * (2 + subDivisions) + j - 1];
					v3 = vertexList[| i * (2 + subDivisions) + j];
					v4 = vertexList[| (i + 1) * (2 + subDivisions) + j];
					
					var m = 1 / (1 + subDivisions);
					
					draw_vertex_texture(v1.x, v1.y, i * m, (j - 1) * m);
					draw_vertex_texture(v2.x, v2.y, (i + 1) * m, (j - 1) * m);
					draw_vertex_texture(v3.x, v3.y, i * m, j * m);
					draw_vertex_texture(v4.x, v4.y, (i + 1) * m, j * m);
				}
				draw_primitive_end();
			}
			draw_set_color(c_white);
		};
	}
	
	// Return the group struct. This can be used for later manipulation, but you don't have to use it.
	return newGroup;
};
#endregion
#region Vertex, stick, attachment and force field constructors
/// @function				vertex(xx, yy, inWeight, inRadius);
/// @param {float} xx		The new vertex x position.
/// @param {float} yy		The new vertex y position.
/// @param {float} inWeight	The new vertex weight.
/// @param {float} inRadius	The new vertex radius.
/// @description			The constructor for a vertex.
function vertex(xx, yy, inWeight, inRadius) constructor {
	x = xx;
	y = yy;
	weight = inWeight;
	xLast = x + random_range(-1, 1);
	yLast = y + random_range(-1, 1);
	radius = inRadius;
	fixed = false;
};

/// @function				stick(inV1, inV2, inLength);
/// @param {int} inV1		The sticks first vertex.
/// @param {int} inV2		The sticks second vertex.
/// @param {int} inLength	The sticks length.
/// @description			The constructor for a stick.
function stick(inV1, inV2, inLength) constructor {
	v1 = inV1;
	v2 = inV2;
	length = inLength;
	active = true; // TEMP
};

/// @function					attachment(inIndex, inObject, inType, inHierarchy, inXOff, inYOff);
/// @param {int} inVertex		The vertex index.
/// @param {int} inObject		The object.
/// @param {int} inType			The attachment type (only applies if the object is attached to the vertex and not vice verca).
/// @param {int} inHierarchy	Whether the object is attached to the vertex (0) or vice verca (1).
/// @param {float} inXOff		The x offset.
/// @param {float} inYOff		The y offset.
/// @description				The constructor for a stick.
function attachment(inIndex, inObject, inType, inHierarchy, inXOff, inYOff) constructor {
	index = inIndex;
	object = inObject;
	type = inType;
	hierarchy = inHierarchy;
	xoff = inXOff;
	yoff = inYOff;
};

/// @function					forceField(inX1, inY1, inX2, inY2, inDir, inStr, inUseNoise);
/// @param {float} inX1			The force fields left position.
/// @param {float} inY1			The force fields top position.
/// @param {float} inX2			The force fields right position.
/// @param {float} inY2			The force fields bottom position.
/// @param {float} inDir		The force fields direction.
/// @param {float} inStr		The force fields strength.
/// @param {float} inUseNoise	Whether the force field should use noise or a constant force.
/// @description				The constructor for a force field.
function forceField(inX1, inY1, inX2, inY2, inDir, inStr, inUseNoise) constructor {
	x1 = inX1;
	y1 = inY1;
	x2 = inX2;
	y2 = inY2;
	dir = inDir;
	str = inStr;
	useNoise = inUseNoise;
};
#endregion
