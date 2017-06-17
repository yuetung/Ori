image_speed=0.1
if !keyboard_check(vk_down) {
state=states.normal
with (shield) {instance_destroy()}
}
