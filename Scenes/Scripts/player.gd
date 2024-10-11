extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var Sprite: Sprite2D
@export var animator:AnimationPlayer

var count =0
var vector= Vector2(1.6,1.6)
var image:Array[String]=["res://art/CharacterSprites/SizeOne.png","res://art/CharacterSprites/SizeTwo.png"
,"res://art/CharacterSprites/SizeThree.png","res://art/CharacterSprites/SizeFour.png",
"res://art/CharacterSprites/SizeFive.png"]
func _physics_process(delta: float) -> void:


	var directionLR = Input.get_axis("ui_left", "ui_right")
	if directionLR:
		velocity.x = directionLR * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionUD = Input.get_axis("ui_up", "ui_down")
	if directionUD:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = directionUD * SPEED
	

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Replace with function body.
	if count<4:
		count+=1
		$Sprite2D.texture= load(image[count])
		if count==1:
			$CollisionShape2D.scale=vector
		if count==2:
			vector.x=2.1
			vector.y=2.1
			$CollisionShape2D.scale=vector
		if count==3:
			vector.x=2.7
			vector.y=2.7
			$CollisionShape2D.scale=vector
		if count==4:
			vector.x=3.2
			vector.y=3.2
			$CollisionShape2D.scale=vector
		#print("sprite changed", count)
