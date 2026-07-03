extends CharacterBody2D

@export var speed = 650

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right 2'):
		input.x += 1
	if Input.is_action_pressed('left 2'):
		input.x -= 1
	if Input.is_action_pressed('down 2'):
		input.y += 1
	if Input.is_action_pressed('up 2'):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	velocity = direction.normalized() * speed
	move_and_slide()
