/// @description Debugger step event
ds_list_delete(fpsAverageList, 0);
ds_list_add(fpsAverageList, fps_real);

if (keyboard_check_pressed(ord("R"))) room_restart();