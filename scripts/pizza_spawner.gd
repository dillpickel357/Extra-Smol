extends Node2D

@export var tray: Sprite2D
@export var dough: RigidBody2D
@export var spawn_point: Marker2D
@export var stop_point: Marker2D
@export var speed = 200
@export var release_delay = 0.5

var offset = Vector2.ZERO
var started = false                # NEW: belt is off until the button starts it
var stopped = false
var released = false
var wait_timer = 0.0

func _ready():
	offset = dough.global_position - tray.global_position
	dough.freeze = true
	dough.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	tray.global_position = spawn_point.global_position
	dough.global_position = tray.global_position + offset

# Call this from the button to start the belt
func start_belt():
	started = true

func _physics_process(delta):
	if not started or released:
		return  # waiting for the button, or already finished

	if not stopped:
		if tray.global_position.x > stop_point.global_position.x:
			tray.global_position.x -= speed * delta
		else:
			tray.global_position.x = stop_point.global_position.x
			stopped = true
		dough.global_position = tray.global_position + offset
	else:
		wait_timer += delta
		if wait_timer >= release_delay:
			dough.freeze = false
			released = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
