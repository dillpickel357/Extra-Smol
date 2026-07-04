extends Area2D

@export var new_texture: Texture2D

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("dough"):
		print("dough entered body");
		
		if body.IsFlattend and not body.HasTomato:
			body.HasTomato = true
			
			if body.has_node("dough_sprite"):
				var target_sprite = body.get_node("dough_sprite") as Sprite2D
				# Use 'new_texture' (matches the @export variable), not 'newSprite'
				if target_sprite and new_texture:
					target_sprite.texture = new_texture   
