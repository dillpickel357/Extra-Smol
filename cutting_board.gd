extends Area2D

@export var target: Node               # the ONLY collider that triggers it
@export var node_to_delete: Node       # this gets removed (e.g. the tomato jar)
@export var sprite_to_change: Sprite2D # this one stays but changes look
@export var new_texture: Texture2D     # its new texture

func _on_body_entered(body):
	if body == target:
		print("froze the target")   # debug — confirms this line runs
		sprite_to_change.texture = new_texture
		node_to_delete.queue_free()
		target.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC
		target.set_deferred("freeze", true)   # deferred so it actually applies
