tool
extends Node2D


export(Color) var backColor = Color.white setget setBackColor
func setBackColor(c):
	backColor = c
	update()

export(float) var width = 200 setget setWidth
func setWidth(wi):
	width =wi
	update()
export(float) var height = 50 setget setHeight
func setHeight(hi):
	height = hi
	update()	

export(bool) var isFilled = true

func _ready():
	update()
	pass # Replace with function body.



func _draw():
	drawBack(width,height)

func drawBack(l,h):
	var backRect1 = Rect2(Vector2(0,0),Vector2(l,h)) 
	draw_rect(backRect1,backColor,isFilled,1)
	var backRect2 = Rect2(Vector2(-l,0),Vector2(l,h)) 
	draw_rect(backRect2,backColor,isFilled,1)
	var backRect3 = Rect2(Vector2(0,0),Vector2(l,-h)) 
	draw_rect(backRect3,backColor,isFilled,1)
	var backRect4 = Rect2(Vector2(-l,0),Vector2(l,-h)) 
	draw_rect(backRect4,backColor,isFilled,1)
	draw_circle(Vector2(-l,0),h,backColor)
	draw_circle(Vector2(l,0),h,backColor)
