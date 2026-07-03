extends Node2D

@onready var body: RigidBody2D = $dough

func disable_physics():
	body.freeze = true
	body.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC
	print("froze dough RigidBody2D")

func enable_physics():
	body.freeze = false
	print("unfroze dough RigidBody2D")
