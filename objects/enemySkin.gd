tool
extends Node2D
export(int) var l = 100 setget setLenght
func setLenght(ll):
	l =ll
	update()
export(Color) var backColor = Color.white setget setColor
func setColor(c):
	backColor = c
	update()
var isFilled = true
func _draw():
	var backRect1 = Rect2(Vector2(0,0),Vector2(l,l)) 
	draw_rect(backRect1,backColor,isFilled,1)
	var backRect2 = Rect2(Vector2(-l,0),Vector2(l,l)) 
	draw_rect(backRect2,backColor,isFilled,1)
	var backRect3 = Rect2(Vector2(0,0),Vector2(l,-l)) 
	draw_rect(backRect3,backColor,isFilled,1)
	var backRect4 = Rect2(Vector2(-l,0),Vector2(l,-l)) 
	draw_rect(backRect4,backColor,isFilled,1)
