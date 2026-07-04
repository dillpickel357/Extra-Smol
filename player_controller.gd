extends CharacterBody2D

@export var speed = 450
@export var push_force = 15   # how hard you shove things
@onready var anim = $AnimatedSprite2D   # <- your AnimatedSprite2D node

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
	update_animation(direction)

	# Push any RigidBody2D we bumped into
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is RigidBody2D:
			collider.apply_central_impulse(-collision.get_normal() * push_force)

func update_animation(direction):
	if direction == Vector2.ZERO:
		anim.stop()   # standing still — or play an idle animation here
		return

	# Pick whichever direction you're pushing hardest (so diagonals snap to one)
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.play("walk right")
		else:
			anim.play("walk left")
	else:
		if direction.y > 0:
			anim.play("walk forward")    # pressing DOWN
		else:
			anim.play("walk back")   # pressing UP
