extends Area2D

@export var target: Node          # the ONLY collider that triggers it
@export var sprite_to_change: Sprite2D
@export var new_texture: Texture2D

func _on_body_entered(body):
	if body.is_in_group("dough"):
		var sprite = body.get_node("Sprite2D");
		if sprite != null:
			sprite.texture = new_texture
		else: 
			print("Sprite Is Null")
