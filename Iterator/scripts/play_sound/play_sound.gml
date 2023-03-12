/// @arg soundid
/// @arg priority
/// @arg doloop
/// @arg optional_pitch
function play_sound() {


	var tempsound;

	tempsound = audio_play_sound(argument[0],argument[1],argument[2])
	audio_sound_gain(tempsound,global.soundvolume,0)

	if argument_count = 4 {
		audio_sound_pitch(tempsound,argument[3])
	}
 
	return tempsound;


}
