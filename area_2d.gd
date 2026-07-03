extends Area2D

@export var conveyor: Node  # drag your conveyor node here

func _on_body_entered(body):
	print("Something entered the button: ", body.name)
	conveyor.start_belt()
