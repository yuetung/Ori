scr_getinputs();

//React to inputs
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

//Jumps
if (place_meeting(x,y+1,BattleGround))
{
    jumps = jumpsmax;
}
else
{
    if (jumps == jumpsmax) jumps -=1;
}

if (key_jump) && (jumps > 0)
{
    jumps -= 1;
    vsp = -jumpspeed;
}

if (vsp < 0) && (!key_jump_held) vsp = max(vsp,-jumpspeed/2)


var hsp_final = hsp + hsp_carry;
hsp_carry = 0;
//Horizontal Collision
if (place_meeting(x+hsp_final,y,BattleGround))
{
    while(!place_meeting(x+sign(hsp_final),y,BattleGround))
    {
        x += sign(hsp_final);
    }
    hsp_final = 0;
    hsp = 0;
}
x += hsp_final;

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

//Animate
if (move!=0) image_xscale = move;
if (place_meeting(x,y+1,BattleGround))
{
    if (move!=0) 
    {
        sprite_index = spr_Player_move; 
        image_speed = movespeed/23;
    }
    else {sprite_index = spr_Player_idle; image_speed = 0.2;}
}

//switch state
if key_jump {
state=states.jumping
sprite_index = spr_Player_Jump;
image_angle=0
jumpcount=0
stop_jump_count=0
stop_signal=false
can_sky_attack=true
image_speed=0.5

}
else if key_c 
{
sprite_index=spr_normal_attack;
image_index=0
inst=instance_create(x+70*sign(image_xscale),y,choose(Slash1,Slash2))
with (inst) {image_xscale=sign(other.image_xscale)}
image_speed=attack_speed*image_number/200
state=states.normal_attack
}
else if key_down 
{
sprite_index=spr_Player_squat;
image_index=0
state=states.squat
shield=instance_create(x,y,Defence_curl)
with(shield) {image_xscale=sign(other.image_xscale)}
}


