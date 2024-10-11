extends Node

var indicator

var playerNode

var targetName = ""
var starPart1
var starPart2
var starPart3
var starPart4
var starPart5

var targetPosit = Vector2()

signal targetHit()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	indicator = $"."
	playerNode = $".."
	starPart1 = $"../../Star_Fragments/StarPart"
	starPart2 = $"../../Star_Fragments/StarPart2"
	starPart3 = $"../../Star_Fragments/StarPart3"
	starPart4 = $"../../Star_Fragments/StarPart4"
	starPart5 = $"../../Star_Fragments/StarPart5"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (starPart1 != null): targetPosit = starPart1.global_position
	elif (starPart2 != null): targetPosit = starPart2.global_position
	elif (starPart3 != null): targetPosit = starPart3.global_position
	elif (starPart4 != null): targetPosit = starPart4.global_position
	elif (starPart5 != null): targetPosit = starPart5.global_position
	else : targetPosit = Vector2(0,0)
	
	indicator.look_at(targetPosit)

func _changeTarget(event):
	pass
