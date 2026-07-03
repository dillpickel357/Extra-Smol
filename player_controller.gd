extends CharacterBody2D

@export var speed = 650
@export var push_force = 80   # how hard you shove things

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right 1'):
		input.x += 1
	if Input.is_action_pressed('left 1'):
		input.x -= 1
	if Input.is_action_pressed('down 1'):
		input.y += 1
	if Input.is_action_pressed('up 1'):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	velocity = direction.normalized() * speed
	move_and_slide()

	# Push any RigidBody2D we bumped into
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is RigidBody2D:
			collider.apply_central_impulse(-collision.get_normal() * push_force)
