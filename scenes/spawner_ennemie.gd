extends Node2D

@onready var markers = $Markers

func _on_timer_timeout():
	var random_marker = markers.get_children().pick_random()
	
	var ennemie_scene = preload("res://scenes/ennemie1.tscn")
	var ennemie = ennemie_scene.instantiate()
	ennemie.global_position = random_marker.global_position
	get_parent().add_child(ennemie)

