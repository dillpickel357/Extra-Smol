extends Node2D

@export var sprite: Sprite2D       # your Sprite2D node
@export var spawn_point: Marker2D  # empty node: where it starts
@export var stop_point: Marker2D   # empty node: where it stops

@export var speed = 200            # pixels per second

func _ready():
	# Place the sprite at the spawn point
	sprite.global_position = spawn_point.global_position

func _process(delta):
	# Move left until it reaches the stop point's x
	if sprite.global_position.x > stop_point.global_position.x:
		sprite.global_position.x -= speed * delta

		# Don't overshoot past the stop point
		if sprite.global_position.x < stop_point.global_position.x:
			sprite.global_position.x = stop_point.global_position.x
