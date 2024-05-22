extends Control
@onready var ui_controls = $Controls
@onready var ui_credits = $Credit
@onready var son_bouton = $Bouton

func _on_button_play_pressed():
	son_bouton.play()
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_button_option_pressed():
	son_bouton.play()
	ui_controls.visible = true

func _on_button_credit_pressed():
	son_bouton.play()
	ui_credits.visible = true

func _on_button_2_pressed():
	son_bouton.play()
	ui_controls.visible = false


func _on_back_2_pressed():
	son_bouton.play()
	ui_credits.visible = false
