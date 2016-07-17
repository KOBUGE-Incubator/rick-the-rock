extends RigidBody2D

onready var init_pos = get_pos().x
const FORCE = 200
const JUMP_FORCE = -200

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	get_node("sprites").set_rotd((get_pos().x * -1)-init_pos)
	
	if Input.is_action_pressed("move_right"):
		set_linear_velocity(Vector2(FORCE,get_linear_velocity().y))
	elif Input.is_action_pressed("move_left"):
		set_linear_velocity(Vector2(-FORCE,get_linear_velocity().y))
		
	if Input.is_action_pressed("jump"):
		if get_linear_velocity().y == 0:
			set_linear_velocity(Vector2(get_linear_velocity().x,JUMP_FORCE))