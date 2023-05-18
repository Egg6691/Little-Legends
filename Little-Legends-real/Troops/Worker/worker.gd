extends CharacterBody2D

@export var team: int = 1
@export var Speed: int = 6
@export var Health: int = 100
var endPoint = Vector2(0,0)
var buildTimer
var busy = false
func _ready():
	buildTimer = $BuildTime
func _process(delta):
	if Health <= 0:
		queue_free()
	if not busy and movementRangeValid():
		var direction = position.direction_to(endPoint).normalized()
		position += direction * Speed;
	if not movementRangeValid():
		busy = true
		buildTimer.start()
	
func moveTo(ep):
	endPoint = ep;
func movementRangeValid():
	if position.x <= endPoint.x + 10 and position.x >= endPoint.x - 10:
		if position.y <= endPoint.y + 10 and position.y >= endPoint.y - 10:
			return false;
	return true;


func _on_build_time_timeout():
	#establish building here
	queue_free()
	pass # Replace with function body.
