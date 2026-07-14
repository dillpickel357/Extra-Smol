extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.is_in_group("dough"):
		print("dough entered body");
		
		if body.IsFlattend and body.HasTomato and body.HasCheese and not body.HasPepperoni:
			body.HasPepperoni = true
			
			if body.has_node("PepperoniOverlay"):
				var target_sprite = body.get_node("PepperoniOverlay") as Sprite2D
				if target_sprite:
					target_sprite.visible = true
