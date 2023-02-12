extends Node2D

enum gameStates{
	PAUSED,
	STARTING,
	PLAYING,
	GAMEOVER
}

	
var gameState = gameStates.STARTING
onready var Player = $player
onready var playerHolder = $playerHolder
onready var scoreLb = $ui/ui/gameOn/c/score
onready var finalscore = $ui/ui/gameOver/c/finalScore/score
onready var scoreLbanim = $ui/ui/gameOn/c/score/fontChange
onready var uianim = $ui/uianim
onready var ememyScene = preload("res://objects/enemy.tscn")
var spawnPositions = []
var rng = RandomNumberGenerator.new()
var score = 0

func _ready():
	rng.randomize()
	setUpGrid()
	setUpPlayer()
	gameState = gameStates.STARTING
	scoreLb.set_text(str(score))
	pass

func _process(delta):
	if Input.is_action_just_pressed("start") and gameState == gameStates.STARTING:
		gameState = gameStates.PLAYING
		$enemySpawner.start()
		pass
	match gameState:
		gameStates.STARTING:
			pass
		gameStates.PLAYING:
			positionPlayer()
		gameStates.PAUSED:
			pass

func positionPlayer():
	if get_global_mouse_position().x > p.screenSize.x-100:
		Player.position.x = p.screenSize.x-100
	elif get_global_mouse_position().x < 100:
		Player.position.x = 100
	else:	
		Player.position.x = get_global_mouse_position().x

func setUpPlayer():
	playerHolder.position = Vector2(p.screenSize.x/2,p.screenSize.y*.66)
	playerHolder.setHeight(p.screenSize.y/50)
	playerHolder.setWidth((p.screenSize.x)/3)
	Player.position = Vector2(p.screenSize.x/2,p.screenSize.y*.66)
	Player.radius = p.screenSize.y/50+10
	pass

func spawnEnemy():
	var newEnemy = ememyScene.instance()
	newEnemy.spawn(getDirection(),getType())
	newEnemy.position = getSpawnPosition()
	$enemyHolder.add_child(newEnemy)
	pass
	
func getDirection():
	return Vector2(0,1)
func getType():
	var which = randi()%5
	if which>1:
		return 0
	else:
		return 1
		
func getSpawnPosition():
	return Vector2(rng.randi_range(100,p.screenSize.x-100),0)
func setUpGrid():
	#setUpSpawnPositions
	pass


func _on_enemySpawner_timeout():
	spawnEnemy()
	pass



func _on_player_hit(area):
	if  "enemy" in area.name and area.type == 0:
		$die.play()
		$enemySpawner.stop()
		for child in $enemyHolder.get_children():
			child.currentState = child.enemyState.PLAYERDIED
			child.die()
		gameState = gameStates.GAMEOVER
		uianim.play("gameOver")
		finalscore.set_text(str(score))
	else:
		$eat.play()
		score = score+1
		scoreLbanim.play("change")
	pass # Replace with function body.


func _on_fontChange_animation_finished(anim_name):
	if anim_name == "change":
		scoreLb.set_text(str(score))
		scoreLbanim.play("changeA")
		pass
	pass # Replace with function body.


func _on_retry():
	uianim.play_backwards("gameOver")
	gameState = gameStates.STARTING
	score = 0
	scoreLb.set_text(str(score))
	pass # Replace with function body.


func _on_home_pressed():
	p.switchScene("res://screens/mainMenu.tscn")
	pass # Replace with function body.
