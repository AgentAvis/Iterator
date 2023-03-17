/// @description Draw some information
// Draw the box
draw_set_color($191118);
draw_rectangle(0, 0, room_width, 99, false);
draw_rectangle(0, room_height - 20, room_width, room_height, false);
draw_rectangle(0, 0, 19, room_height, false);
draw_rectangle(room_width - 20, 0, room_width, room_height, false);
draw_set_color(c_white);
draw_rectangle(20, 100, room_width - 21, room_height - 21, true);

// Draw information
draw_set_font(fntDefault);
//draw_set_halign(fa_right);
//draw_text(room_width - 5, 5, "FPS " + string(fps));
//draw_text(room_width - 5, 15, "REAL FPS " + string(fps_real));
//draw_text(room_width - 5, 25, "AVERAGE " + string(round(fpsAverage)));
//draw_set_halign(fa_left);

draw_text(20, 10, "Verlet group templates");
draw_set_color(c_gray);
draw_text(20, 25, "verletGroupCreateRope();");
draw_text(20, 35, "verletGroupCreateRopeTextured();");
draw_text(20, 45, "verletGroupCreateBox();");
draw_text(20, 55, "verletGroupCreateBoxTextured();");
draw_text(20, 65, "verletGroupCreateCloth();");
draw_text(20, 75, "verletGroupCreateClothTextured();");
draw_set_color(c_white);