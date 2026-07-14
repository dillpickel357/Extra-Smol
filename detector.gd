extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("dough"):
		print("dough entered body");
		
		if body.IsFlattend and not body.HasTomato:
			body.HasTomato = true
			
			if body.has_node("TomatoOverlay"):
				var target_sprite = body.get_node("TomatoOverlay") as Sprite2D
				if target_sprite:
					target_sprite.visible = true
