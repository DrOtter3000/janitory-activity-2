extends Node3D


@export var new_enemy : PackedScene


func spawn_enemy():
	var enemy = new_enemy.instantiate() as Node3D
	add_child(enemy)
	enemy.global_position = Vector3.ZERO
