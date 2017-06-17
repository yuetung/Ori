image_speed=0
image_angle-=attack_speed*360/200
/*if (vsp < 10) vsp += grav;
//Vertical Collision
if (place_meeting(x,y+vsp,BattleGround))
{
    while(!place_meeting(x,y+sign(vsp),BattleGround))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
*/

if image_angle<=original_angle-360 {
state=states.jumping; 
can_sky_attack=false;

}
