extends Node2D

@export var scene_to_spawn: PackedScene
@export var spawn_point: Marker2D
@export var stop_point: Marker2D
@export var speed: float = 200.0
@export var release_delay: float = 0.5

var instance: Node2D
var dough: RigidBody2D

var moving := false
var timer := 0.0

func start_belt():
	if instance != null:
		return

	instance = scene_to_spawn.instantiate() as Node2D
	add_child(instance)

	instance.global_position = spawn_point.global_position

	dough = instance.get_node("dough") as RigidBody2D

	dough.freeze = true
	dough.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC

	moving = true
	timer = 0.0

func _physics_process(delta):
	if instance == null:
		return

	if moving:
		instance.global_position.x -= speed * delta

		if instance.global_position.x <= stop_point.global_position.x:
			instance.global_position.x = stop_point.global_position.x
			moving = false
	else:
		timer += delta

		if timer >= release_delay:
			dough.freeze = false
			instance = null
