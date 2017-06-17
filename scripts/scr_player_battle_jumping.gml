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
if (place_meeting(x,y+vsp,BattleGround) && jumpcount>3)
{
    sprite_index=spr_Player_Fall
    image_index=2
    image_angle=0
    while(!place_meeting(x,y+sign(vsp),BattleGround))
    {
        y += sign(vsp);
    }
    vsp = 0;
    stop_signal=true
    
}
y += vsp;

//Animate
if (move!=0) image_xscale = move;
/*if (place_meeting(x,y+1,BattleGround))
{
    if (move!=0) 
    {
        sprite_index = spr_Player_move; 
        image_speed = 1;
    }
    else sprite_index = spr_Player_idle; image_speed = 0.2;
}
else
{*/
    if (vsp < 0) {
    //jumping animation 
    sprite_index=spr_Player_Jump
    if (image_index<=1) {image_speed=0.5}
    else {
    /*if (image_angle<=30){
        if hsp!=0 {image_angle-=(30/jumpspeed*grav)*sign(hsp)}
        else {image_angle-=(30/jumpspeed*grav)}}
    if image_angle<=30 {image_index=2; image_speed=0;}
    else {image_index=3; image_speed=0;}
    }*/
        image_index=2
        if sign(image_xscale)>0 {image_angle=-30-2*vsp*sign(image_xscale)}
        if sign(image_xscale)<0 {image_angle=30-2*vsp*sign(image_xscale)}}
        
    
}
    else if ((vsp>=0) && stop_signal=false) {
    //falling animation
    /*if (falling_start==true && stop_jump_count==0){
    if (image_angle<=30){
        if hsp!=0 {image_angle-=(30/jumpspeed*grav)*sign(hsp)}
        else {image_angle-=(30/jumpspeed*grav)}}
    if image_angle<=30 {image_index=0; image_speed=0;}
    else {image_index=1; image_speed=0;}
    
    }
    
    else if falling_start==false {
    falling_start=true;
    sprite_index = spr_Player_Fall;
    image_angle=0
    }*/
        sprite_index=spr_Player_Fall
        if (stop_jump_count==0){
            image_index=0
            image_speed=0
            image_angle=-2*vsp*sign(image_xscale)
    }
    }
//}
jumpcount+=1


//switch states
//stop signal

if (stop_signal=true && jumpcount>3){
    image_angle=0
    state=states.normal
}


//jump end animation
//if (place_meeting(x,y+1,BattleGround) && jumpcount>3/* && stop_jump_count==0*/) {
//image_index=2; 
//image_angle=0
//image_speed=0;
//stop_jump_count+=1;

//}
/*if stop_jump_count>0 {stop_jump_count+=1}
if stop_jump_count>=3 {image_index=3; image_angle=0; image_speed=0;}

if (stop_jump_count>=6){
state=states.normal; 

}
*/
if (key_c && can_sky_attack==true){
sprite_index=spr_sky_attack;
image_index=0
inst=instance_create(x,y,Sky_spin)
with (inst) {image_angle=sign(other.image_angle)}
image_speed=attack_speed*image_number/200
original_angle=image_angle
state=states.sky_attack
}

