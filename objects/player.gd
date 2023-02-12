tool
extends Area2D


export(int) var radius =  7 setget setRadius
func setRadius(r):
	radius = r
	update()
export(Color) var playerColor = Color.green setget setPlayerColor
func setPlayerColor(c):
	playerColor = c
	update()
	pass

func _ready():
	update()
	pass

func _draw():
	draw_circle(Vector2.ZERO,radius,playerColor)
	pass
