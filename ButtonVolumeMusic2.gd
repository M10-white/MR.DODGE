extends TextureButton

@onready var animated_sprite = $volume
@onready var music2 = $AudioStreamPlayer2D

var is_volume_on = true

func _ready():
	animated_sprite.play("animed")  # Jouer l'animation par défaut

func _on_pressed():
	if is_volume_on:
		animated_sprite.play("stop")
		is_volume_on = false
		music2.stop()  # Arrête la musique
	else:
		animated_sprite.play("animed")
		is_volume_on = true
		music2.play()  # Démarre la musique
