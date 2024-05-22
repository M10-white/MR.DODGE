extends CharacterBody2D

signal dead

@onready var sprite = $AnimatedSprite2D

# Vitesse de déplacement
var speed = 200

func _process(delta):
	# Gérer les entrées de déplacement
	var move_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		move_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		move_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		move_vector.y -= 1
	
	if Input.is_action_pressed("move_right"):
		move_vector.x += 1
	if Input.is_action_pressed("move_left"):
		move_vector.x -= 1
	if Input.is_action_pressed("move_down"):
		move_vector.y += 1
	if Input.is_action_pressed("move_top"):
		move_vector.y -= 1

	# Normaliser le vecteur de déplacement pour éviter le déplacement plus rapide en diagonale
	move_vector = move_vector.normalized()

	# Appliquer le déplacement et gérer les collisions
	move_and_collide(move_vector * speed * delta)

	# Limite Écran
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

	# Gérer les animations
	animations(move_vector)

func animations(move_vector):
	if move_vector == Vector2.ZERO:
		sprite.play("idle")
	else:
		sprite.play("run")

func death():
	dead.emit()
	queue_free()
