tool
extends Control

onready var settingsMenu = $settings
onready var mainMenu = $main
onready var highscoreMenu = $highscore
onready var tween = $Tween

var menuOriginPos = Vector2.ZERO
var menuOriginSize = Vector2.ZERO
var menuTransitionTime = .4

var currentMenu
var menuStack = []

func _ready():
	menuOriginPos = Vector2(0,0)
	menuOriginSize = get_viewport_rect().size
	
	currentMenu = mainMenu


func moveToNextMenu(nextMenuID):
	var nextMenu = getMenuFromMenuId(nextMenuID)
	tween.interpolate_property(currentMenu,"rect_global_position",currentMenu.rect_global_position,Vector2(0,-menuOriginSize.y),menuTransitionTime)
	tween.interpolate_property(nextMenu,"rect_global_position",nextMenu.rect_global_position,menuOriginPos,menuTransitionTime)
	tween.start()
	menuStack.append(currentMenu)
	currentMenu = nextMenu
	pass

func moveToPreviousMenu():
	var previousMenu = menuStack.pop_back()
	if previousMenu!=null:
		tween.interpolate_property(previousMenu,"rect_global_position",previousMenu.rect_global_position,menuOriginPos,menuTransitionTime)
		tween.interpolate_property(currentMenu,"rect_global_position",currentMenu.rect_global_position,Vector2(0,menuOriginSize.y),menuTransitionTime)
		tween.start()
		currentMenu = previousMenu
	pass

func getMenuFromMenuId(menuID):
	match menuID:
		"settings":
			return settingsMenu
		"main":
			return mainMenu
		"highscore":
			return highscoreMenu
		_:
			return mainMenu
	pass


func _on_highscore_pressed():
	$"../../woosh".play()
	moveToNextMenu("highscore")


func _on_backButton_pressed():
	$"../../woosh".play()
	moveToPreviousMenu()


func _on_settings_pressed():
	$"../../woosh".play()
	moveToNextMenu("settings")
	pass # Replace with function body.
