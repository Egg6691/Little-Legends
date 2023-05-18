extends Node2D
var ENEMY: PackedScene = preload("res://Troops/Enemy/enemy.tscn")
var rng = RandomNumberGenerator.new()

var wood = 2000
var stone = 2000
var food = 2000
var mana = 2000
var castles = 1
var timer
func _wood(num):
	wood -= num
	get_node("Camera2D/CanvasLayer/UI")._wood(num)
func _stone(num):
	stone -= num
	get_node("Camera2D/CanvasLayer/UI")._stone(num)
func _food(num):
	food -= num
	get_node("Camera2D/CanvasLayer/UI")._food(num)
func _mana(num):
	mana -= num
	get_node("Camera2D/CanvasLayer/UI")._mana(num)
func _ready():
	# set up the timer and stuff
	timer = $EnemySpawnTimer
	timer.start() 
func _process(float):
	if castles <= 0:
		get_tree().reload_current_scene()
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			var click_location = event.position + get_node("Camera2D").position- get_viewport_rect().size/2
			get_node("Soldier").moveTo(click_location)
func _on_enemy_spawn_timer_timeout(): # ask brandon how to get game time
	rng.randomize()
	var amtOfEnemies = rng.randi_range(5,20)
	for n in range(amtOfEnemies):
		var opp = ENEMY.instantiate()
		get_tree().current_scene.add_child(opp)
		var randomSide = rng.randi_range(1,4)
		var bounds = 1040
		if randomSide == 1:# left
			opp.position = Vector2(-bounds,rng.randi_range(-bounds,bounds))
		if randomSide == 2:# right
			opp.position = Vector2(bounds,rng.randi_range(-bounds,bounds))
		if randomSide == 3:# top
			opp.position = Vector2(rng.randi_range(-bounds,bounds),-bounds)
		else: # bottom
			opp.position = Vector2(rng.randi_range(-bounds,bounds),bounds)
		# var nearestCastle = findNearestCastle()
		#opp.moveTo(nearestCastle.position)
	timer.start()
func findNearestCastle():
	pass
