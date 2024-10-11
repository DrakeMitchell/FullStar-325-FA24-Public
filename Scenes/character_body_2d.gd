extends CharacterBody2D

@export var speed = 75
@export var acceleration = 0.1
@export var mass = 1
@export var health = 3

@export var currentArea: Array[Grav_Obj] = []
@export var Sprite: Sprite2D
@export var animator:AnimationPlayer
@export var anisprites:Sprite2D

var winNext = false
var count =0
var vector= Vector2(1.6,1.6)
var image:Array[String]=["res://art/CharacterSprites/SizeOne.png","res://art/CharacterSprites/SizeTwo.png"
,"res://art/CharacterSprites/SizeThree.png","res://art/CharacterSprites/SizeFour.png",
"res://art/CharacterSprites/SizeFive.png"]
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity += input_direction * (acceleration * speed) / mass
	if velocity.x >= 800:
		velocity.x = 800
	elif velocity.x <= -800:
		velocity.x = -800
	if velocity.y >= 800:
		velocity.y = 800
	elif velocity.y <= -800:
		velocity.y = -800
	look_at(get_global_mouse_position())

func _touch():
	#if !collision_layer(2):
		health -= 1
		$AnimatedSprite2D.set_visible(randi_range(0,1))
	

func _physics_process(_delta):
	get_input()
	#if currentArea:
	#	for area in currentArea:
	#		area.apply_gravity(self)
	#print_debug(velocity)
			
	move_and_slide()

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0


#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("collided!")
	# Replace with function body.
	if body.is_in_group("Hazard"):
		get_tree().change_scene_to_file("res://Scenes/Lose Screen.tscn")
	
	if winNext:
		get_tree().change_scene_to_file("res://Scenes/Win Screen.tscn")
	
	if not winNext:
		if count<4:
			count+=1
			$Sprite2D.texture= load(image[count])
		if count==1:
			animator.play("Size1to2")
			$CollisionShape2D.scale=vector
		if count==2:
			animator.play("Size2to3")
			vector.x=2.1
			vector.y=2.1
			$CollisionShape2D.scale=vector
		if count==3:
			animator.play("Size3to4")
			vector.x=2.7
			vector.y=2.7
			$CollisionShape2D.scale=vector
		if count==4:
			animator.play("Size4to5")
			vector.x=3.2
			vector.y=3.2
			$CollisionShape2D.scale=vector
			winNext = true
	
	#print("sprite changed", count)
	
	#_on_area_2d_body_entered(area


func _on_blue_planet_6_body_entered(body: Node2D) -> void:
	print("hit planet")
