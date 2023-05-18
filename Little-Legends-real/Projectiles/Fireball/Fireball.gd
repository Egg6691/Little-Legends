extends Area2D
var endPoint
var endReached
@export var Speed = 100
var team
# Called when the node enters the scene tree for the first time.
func _ready():
	endReached = false
	pass # Replace with function body.

func setEndPoint(ep):
	endPoint = ep
func setTeam(teamVal):
	team = teamVal
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if endPoint != null:
		if not endReached and movementRangeValid():
			endReached = true
			var direction = position.direction_to(endPoint).normalized()
			position += direction * Speed;
		if endReached and team != null:
			var allBodies = get_overlapping_bodies()
			for body in allBodies:
				if body.Health > 0 and body.team != team:
					body.Health-=20;
			queue_free()
func movementRangeValid():
	if position.x <= endPoint.x + Speed and position.x >= endPoint.x - Speed:
		if position.y <= endPoint.y + Speed and position.y >= endPoint.y - Speed:
			return false;
	return true;
