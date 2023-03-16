// From https://marketplace.yoyogames.com/assets/1423/advanced-circle-drawing
// by Patych
// Upgraded to GMS2 and cleaned up by Matt
// 
// Arguments: 
// x, y — Center of circle.
// r — Radius.
// bones — Amount of bones. More bones = more quality, but less speed. Minimum — 3.
// ang — Angle of first circle's point.
// angadd — Angle of last circle's point (relative to ang). 
// width — Width of circle (may be positive or negative).
// outline — 0 = curve, 1 = sector. 
function draw_circle_ext(_x, _y, r, bones = 15, ang = 0, angadd = 360, width = 1, outline = false)
{
    bones = max(3, bones);
 
    var a = angadd / bones;
    var halfWidth = width / 2;
    var lp = r + halfWidth;
    var lm = r - halfWidth;
    var AAa = ang + angadd;
    
    if(outline)
    {
        //OUTLINE
        draw_primitive_begin(pr_trianglestrip); //Change to pr_linestrip, to see how it works.
        draw_vertex(_x + lengthdir_x(lm, ang), _y + lengthdir_y(lm, ang)); //First point.
        for(var i = 1; i <= bones; i++)
        {
            var dp = ang + a * i;
            var dm = dp - a;
            draw_vertex(_x + lengthdir_x(lp, dm), _y + lengthdir_y(lp, dm));
            draw_vertex(_x + lengthdir_x(lm, dp), _y + lengthdir_y(lm, dp));
        }
        draw_vertex(_x + lengthdir_x(lp, AAa), _y + lengthdir_y(lp,AAa));
        draw_vertex(_x + lengthdir_x(lm, AAa), _y + lengthdir_y(lm,AAa)); //Last two points to make circle look right.
    }
    else
    {
        //SECTOR
        draw_primitive_begin(pr_trianglefan); //Change to pr_linestrip, to see how it works.
        draw_vertex(_x, _y); //First point in the circle's center.
        for(var i = 1; i <= bones; i += 1)
        {
            var dp = ang + a * i;
            var dm = dp - a;
            draw_vertex(_x + lengthdir_x(lp,dm), _y + lengthdir_y(lp,dm));
        }
        draw_vertex(_x + lengthdir_x(lp,AAa), _y + lengthdir_y(lp,AAa)); //Last point.
    }
    draw_primitive_end();
}