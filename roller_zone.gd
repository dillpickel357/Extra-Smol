extends Area2D

@export var sprite_to_change: Sprite2D
@export var new_texture: Texture2D

func _on_body_entered(body):
	if body.is_in_group("dough"):
		if !body.IsFlattend:
			sprite_to_change.texture = new_texture
			body.IsFlattend = true;
