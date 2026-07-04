extends Area2D

@export var new_texture: Texture2D

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("dough"):
		print("dough entered body");
		
		if body.IsFlattend and body.HasTomato and not body.HasCheese:
			body.HasCheese = true
			
			if body.has_node("dough_sprite"):
				var target_sprite = body.get_node("dough_sprite") as Sprite2D
				if target_sprite and new_texture:
					target_sprite.texture = new_texture
