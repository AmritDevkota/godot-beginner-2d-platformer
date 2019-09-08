extends "res://src/actors/Actor.gd"


export var score: = 100


func _ready() -> void:
	set_physics_process(false)
	_linear_velocity.x = -speed.x


func _on_StompArea2D_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("player"):
		die()


func _on_BumpArea2D_body_shape_entered(body_id: int, body: PhysicsBody2D, body_shape: int, area_shape: int) -> void:
	_linear_velocity.x = speed.x if area_shape == 0 else -speed.x


func die() -> void:
	PlayerData.score += score
	queue_free()
