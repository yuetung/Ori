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
        image_speed = 0.5;
    }
    else sprite_index = spr_Player_idle; image_speed = 0.5;
}
else
{
    if (vsp < 0) sprite_index = spr_Player_Jump; else sprite_index = spr_Player_Fall;
}
jumpcount+=1
//switch states
if place_meeting(x,y+1,BattleGround) && jumpcount>3 {state=states.normal}
if key_c {
sprite_index=spr_sky_attack;
image_index=0
state=states.sky_attack
}

