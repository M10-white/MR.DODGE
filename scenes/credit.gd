extends CanvasLayer
@onready var son_bouton = $Bouton

func _on_github_pressed():
	son_bouton.play()
	OS.shell_open("https://github.com/M10-white")


func _on_linkedin_pressed():
	son_bouton.play()
	OS.shell_open("https://www.linkedin.com/in/chkbrahim/")


func _on_youtube_pressed():
	son_bouton.play()
	OS.shell_open("https://www.youtube.com/@chkwebdev")
