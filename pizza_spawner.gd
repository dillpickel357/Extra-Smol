extends Node2D

@export var tray: Sprite2D         # the tray (Sprite2D)
@export var dough: RigidBody2D     # the dough (RigidBody2D)
@export var spawn_point: Marker2D  # where the belt starts
@export var stop_point: Marker2D   # where the belt stops
@export var speed = 200
@export var release_delay = 0.5    # seconds to wait after stopping before turning the rig body on

var offset = Vector2.ZERO
var stopped = false                # tray has reached the stop point
var released = false               # rig body has been turned back on
var wait_timer = 0.0               # counts up while waiting

func _ready():
	offset = dough.global_position - tray.global_position

	# Turn the rig body OFF for the ride
	dough.freeze = true
	dough.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC

	tray.global_position = spawn_point.global_position
	dough.global_position = tray.global_position + offset

func _physics_process(delta):
	if released:
		return  # rig body is on and pushable — nothing left to do

	if not stopped:
		# Still riding the belt
		if tray.global_position.x > stop_point.global_position.x:
			tray.global_position.x -= speed * delta
		else:
			tray.global_position.x = stop_point.global_position.x
			stopped = true  # arrived — start the wait

		# Keep the dough locked to the tray while it's off
		dough.global_position = tray.global_position + offset
	else:
		# Stopped — wait release_delay, then turn the rig body on
		wait_timer += delta
		if wait_timer >= release_delay:
			dough.freeze = false  # rig body back ON → damp + pushing work again
			released = true
