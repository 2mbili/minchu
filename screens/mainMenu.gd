extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_touch_pressed():
	$audio.play()
	
	pass # Replace with function body.

func _on_touch_button_up():
	p.switchScene("res://screens/game.tscn")
	pass # Replace with function body.
