extends Node3D


func animate():
	$AnimationPlayer.play("clean")


func continue_idle():
	$AnimationPlayer.play("Idle")
