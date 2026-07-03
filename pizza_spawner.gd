extends Node2D

const DOUGH = preload("uid://c7slcac2xbceh")

@onready var spawn: Marker2D = $spawn
@onready var stop: Marker2D = $stop

@export var spawn_delay := 3
@export var move_speed := 300.0

var spawning := false
var timer := 0.0
var dough_list := []

func _process(delta):
	if spawning:
		timer += delta
		if timer >= spawn_delay:
			timer = 0.0
			spawn_dough()

	move_doughs(delta)

func start_belt():
	spawning = true

func stop_belt():
	spawning = false

func spawn_dough():
	var dough = DOUGH.instantiate()
	add_child(dough)

	dough.global_position = spawn.global_position
	dough_list.append(dough)
	
	print("spawned dough");
	dough.disable_physics();
	
func move_doughs(delta):
	for dough in dough_list:
		if dough == null:
			continue

		var target = stop.global_position

		dough.global_position = dough.global_position.move_toward(
			target,
			move_speed * delta
		)

		if dough.global_position.distance_to(target) < 1.0:
			dough.global_position = target

			if dough.has_method("enable_physics"):
				dough.enable_physics()

			dough_list.erase(dough)
