/// @description Initialize the debug object
fpsAverage = 0;
fpsAverageList = ds_list_create();
fpsAveragePrec = 100;
fpsAverageUpdateDelay = room_speed / 2;

repeat (fpsAveragePrec) ds_list_add(fpsAverageList, 0);
alarm[0] = fpsAverageUpdateDelay;
