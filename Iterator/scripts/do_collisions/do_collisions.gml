function do_collisions() {
	//========================================================
	on_ground = false

	var _hitsomething = false;

	//Horizontal Collision
	if (place_meeting(x+hsp,y,oSolid))
	{
	    yplus = 0;
	    if /*was while*/ (place_meeting(x+hsp,y-yplus,oSolid) && yplus <= abs(1*hsp)) yplus +=1;
	    if place_meeting(x+hsp,y-yplus,oSolid)
	    {
			_hitsomething = true
	        if /*was while*/ (!place_meeting(x+sign(hsp),y,oSolid))
	        {
	            x += sign(hsp);
	        }
	        hsp = 0;
	    }
	    else
	    {
	        y -= yplus;
	    }
	}

	x += hsp * global.timescale

	//Vertical Collision
	if (vsp == 0) // "Stick" player to ground on shallow downward slopes
	{
	    yplus = 0;
	    if /*was while*/ (!place_meeting(x,y+yplus+1,oSolid) && yplus <= abs(1*hsp)) yplus +=1;
	    if place_meeting(x,y+yplus+1,oSolid)
	    {
	        y += yplus;
	    }
	}

	if (place_meeting(x,y+vsp,oSolid))
	{
   
			_hitsomething = true
	        if /*was while*/(!place_meeting(x,y+sign(vsp),oSolid))
	        {
	            y += sign(vsp);
	        }
	        vsp = 0;
	        on_ground = true
    
	}
	y += vsp * global.timescale


	return _hitsomething;
	//========================================================


}
