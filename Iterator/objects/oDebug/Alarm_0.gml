/// @description Debug alarm, update average fps
fpsAverage = 0;
for (var i = 0; i < fpsAveragePrec; i++) fpsAverage += fpsAverageList[| i];
fpsAverage /= fpsAveragePrec;

alarm[0] = fpsAverageUpdateDelay;
