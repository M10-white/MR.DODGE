extends Node2D

@onready var score_label = $UI/Score
@onready var ui_game_over = $GameOver
@onready var final_score_label = $GameOver/ScoreOver
@onready var enemy_spawner = $SpawnerEnnemie
@onready var spawn_timer = $SpawnerEnnemie/Timer
@onready var button_volume = $UI/ButtonVolumeMusic2
@onready var music1 = $UI/ButtonVolumeMusic2/AudioStreamPlayer2D
@onready var son = $AudioStreamPlayer2D2
@onready var son2 = $AudioStreamPlayer2D3

var score = 0
var is_player_alive = true

func _ready():
	# Connecte le signal du timer au niveau
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))

func _on_timer_timeout():
	if is_player_alive:
		son2.play()
		score += 1
		score_label.text = "LEVEL : " + str(score)
		adjust_spawn_rate(score)

func adjust_spawn_rate(score):
	# Réduit le temps d'attente du timer de 0.1 seconde pour chaque point de score
	spawn_timer.wait_time = max(1.0 - score * 0.1, 0.2)  # Réduit de 0.1 seconde par point de score, minimum de 0.1 seconde

func _on_player_dead():
	music1.stop()
	son.play()
	is_player_alive = false
	score_label.visible = false
	ui_game_over.visible = true
	button_volume.visible = false
	final_score_label.text = "FINAL LEVEL : " + str(score)

func _on_spawn_timer_timeout():
	enemy_spawner._on_timer_timeout()  # Appel à la fonction du spawner
