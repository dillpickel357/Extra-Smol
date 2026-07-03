extends Area2D

@onready var conveyor: Node2D = $"../conveyor"

func _on_body_entered(body):
	conveyor.start_belt()
