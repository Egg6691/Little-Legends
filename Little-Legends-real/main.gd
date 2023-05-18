extends Node2D


var wood = 2000
var stone = 2000
var food = 2000
var mana = 2000
var castles = 1
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
func _process(float):
	if castles <= 0:
		get_tree().reload_current_scene()
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			var click_location = event.position + get_node("Camera2D").position- get_viewport_rect().size/2
			get_node("Soldier").moveTo(click_location)
