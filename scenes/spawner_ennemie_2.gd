extends Node2D

@onready var markers2 = $Markers

func _on_timer_timeout():
	var random_marker = markers2.get_children().pick_random()
	
	var ennemie2_scene = preload("res://scenes/ennemie2.tscn")
	var ennemie2 = ennemie2_scene.instantiate()
	ennemie2.global_position = random_marker.global_position
	get_parent().add_child(ennemie2)
