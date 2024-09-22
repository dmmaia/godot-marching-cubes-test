extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 15.0  # movement speed
var jump_speed = 0.5  # determines jump height
var mouse_sensitivity = 0.02  # turning speed


func get_input():
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	#velocity.x = input.x * speed
	rotate_y(input.x * -mouse_sensitivity)
	velocity = movement_dir * speed
	if Input.is_key_pressed(KEY_SPACE):
		velocity.y = 1*jump_speed
	if Input.is_key_pressed(KEY_CTRL):
		velocity.y = -1*jump_speed

func _physics_process(delta):
	#velocity.y += -gravity * delta
	get_input()
	move_and_slide()
