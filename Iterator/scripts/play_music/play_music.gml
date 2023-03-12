/// @arg soundid
/// @arg priority
/// @arg doloop
/// @arg optional_pitch
function play_music() {

	/*
		There can not be more than one audio track playing in the game.
		With that said, this script is responsible for fading out prexisting
		tracks and fading in the provided soundid.
	*/

	var tempsound;

	tempsound = audio_play_sound(argument[0],argument[1],argument[2]);
	audio_sound_gain(tempsound,global.soundvolume,0);
	if (argument_count > 3) audio_sound_pitch(tempsound,argument[3]);
 
	return tempsound;


}
