extends Area2D

@onready var ennemi = $AnimatedSprite2D

func _physics_process(delta):
	var speed = 250
	global_position.y += speed * delta
	# Gérer les animations
	animations(global_position)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func animations(global_position):
	if global_position == Vector2.ZERO:
		ennemi.play("idle")
	else:
		ennemi.play("run")

func _on_body_entered(body):
	if body.has_method("death"):
		body.death()
	queue_free()