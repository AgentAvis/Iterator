#region Tweakables
mspd = 6			// how fast the camera moves when in spectator mode.
mouse_lerp_mag = .1 // how much the camera's view lerps between the camera position and the mouse cursor coordinates.
lerpspeed = .25		// how fast the camera's actual postition chases the desired camera position.
zoom_lerp_rate = .2 // how fast the camera's actual zoom level lerps to the desired zoom level.
#endregion

#region Init

mouselerp = false
can_zoom = true
shake_amount = 0
shake_time = 0
tarx = x //this is the final, desired x. Camera lerps to this
tary = y //this is the final, desired y. Camera lerps to this
mode = 1 //mode 0 is static, mode 1 is keyboard movement, mode 2 is follow an object
target = noone //needs to be something for mode 2
zoom_level = .5; //percentage of 1, less zooms more in, more zooms more out 1 is perfect 1:1 ratio
scroll_level = 1 //four levels, 1,2,3,4
true_zoom_level = zoom_level

#endregion

#region Camera Setup
//Build a camera at (0,0), with size 512x384, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(0, 0, 512, 384, 0, -1, -1, -1, 32, 32);
//Set view0 to use the camera "camera"
view_set_camera(0, camera);
//Get the starting view size to be use_d for interpolation later
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);

#endregion
















