extends Area2D

@export var new_texture: Texture2D

func _on_body_entered(body):
	if body.is_in_group("dough"):
		if !body.IsFlattend:
			print("flattening dough")
			if body.has_node("Sprite2D") and new_texture:
				body.get_node("Sprite2D").texture = new_texture
			body.IsFlattend = true;
