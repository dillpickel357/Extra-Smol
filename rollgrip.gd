extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:  # the player is now using the roller
		for dough in get_tree().get_nodes_in_group("dough"):
			body.add_collision_exception_with(dough)     # player phases over dough

func _on_body_exited(body):
	if body is CharacterBody2D:  # player stepped away from the roller
		for dough in get_tree().get_nodes_in_group("dough"):
			body.remove_collision_exception_with(dough)  # player can push dough again
