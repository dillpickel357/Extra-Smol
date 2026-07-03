extends Area2D

@export var target: Node          # the ONLY collider that triggers it
@export var sprite_to_change: Sprite2D
@export var new_texture: Texture2D

func _on_body_entered(body):
	if body == target:            # ignore everything except your chosen collider
		sprite_to_change.texture = new_texture
