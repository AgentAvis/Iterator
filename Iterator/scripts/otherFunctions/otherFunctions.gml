/// @function				collide(xx, yy, radius);
/// @param {float} xx		The x position to check.
/// @param {float} yy		The y position to check.
/// @param {float} radius	The points radius ro check.
/// @description			Custom collision function. Replace this with whatever fits your game.
function collide(xx, yy, radius) {
	var inst;
	
	inst = instance_position(xx - radius, yy, parCollision);
	if (inst != noone) return inst;
	inst = instance_position(xx + radius, yy, parCollision);
	if (inst != noone) return inst;
	inst = instance_position(xx, yy - radius, parCollision);
	if (inst != noone) return inst;
	inst = instance_position(xx, yy + radius, parCollision);
	if (inst != noone) return inst;
	
	return noone;
};

/// @function				approach(startValue, goalValue, amount);
/// @description			Approaches a [goalValue] from the [startValue] by an [amount].
/// @param {int} startValue	The value to start from.
/// @param {int} goalValue	The goal value to reach.
/// @param {int} amount		The amount to move.
function approach(startValue, goalValue, amount) {
	var r = startValue;
	
	if (goalValue > startValue) {
		r = clamp(r + amount, r, goalValue);
	} else {
		r = clamp(r - amount, goalValue, r);
	}
	
	return r;
};
