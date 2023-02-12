extends Node2D

var screenSize = Vector2(0,0)
var debug = true

func _ready():
	screenSize = Vector2(720,1280) #OS.get_screen_size()
	pass

func switchScene(path):
	get_tree().change_scene(path)
	pass
