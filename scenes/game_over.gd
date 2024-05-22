extends CanvasLayer
@onready var son_bouton = $Bouton

func _on_button_pressed():
	son_bouton.play()
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	son_bouton.play()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
