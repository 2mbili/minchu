extends Area2D
enum enemyState{
	SPAWNING,
	FALLING,
	HIT,
	PLAYERDIED
}
var type = 0
var currentState = enemyState.SPAWNING
export var direction = Vector2(0,1)
var speed = 20
var rng = RandomNumberGenerator.new()
var hero = false


func _onready():
	rng.randomize()
	pass

func  _process(delta):
	match currentState:
		enemyState.SPAWNING:
			pass
		enemyState.FALLING:
			position = position+direction*speed
			pass
		enemyState.HIT:
			pass
		enemyState.PLAYERDIED:
			pass
	if position.y > 1800:
		queue_free()

func spawn(dir,t):
	type = t
	direction = dir
	currentState = enemyState.FALLING
	var reverse = randi()%5
	if reverse>2:
		$anim.play("fall")
	else:
		$anim.play_backwards("fall")
	if t ==1:
		$skin.modulate = Color.green
	pass

func die():
	if hero:
		$anim.play("kill")
		pass
	else:
		$anim.play("die")
		pass
	pass

func _on_enemy_area_entered(area):
	set_monitoring(false)
	if "player" in area.name and type==0:
		hero = true
	elif "player" in area.name:
		currentState = enemyState.HIT
		$anim.play("celebrate")
	pass # Replace with function body.


func _on_anim_animation_finished(anim_name):
	if anim_name == "celebrate":
		queue_free()
	elif anim_name == "kill" or anim_name == "die":
		queue_free()
	pass # Replace with function body.
