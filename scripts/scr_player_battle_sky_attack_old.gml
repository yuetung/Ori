image_speed=0.5

vsp=3
if (vsp < 10) vsp += grav;
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


if image_index > image_number - 1 {
if place_meeting(x,y,BattleGround) {state=states.normal}
else {state=states.jumping; can_sky_attack=false}
}
