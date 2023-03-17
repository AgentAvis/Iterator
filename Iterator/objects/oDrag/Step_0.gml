/// @description Drag the object
if (point_distance(x, y, mouse_x, mouse_y) < rad && mouse_check_button_pressed(mb_left)) {
	isDragging = true;
}

if (!mouse_check_button(mb_left)) isDragging = false;

if (isDragging) {
	x = mouse_x;
	y = mouse_y;
}