extends Area2D
class_name Grav_Obj

@export var player: CharacterBody2D
@export var sprite : String

@export var gravity_str: float = 200000
@export var forceMult: int = 400

@export var contactDist: int = 400

var hit
# Called when the node enters the scene tree for the first time.

func apply_gravity(character: CharacterBody2D):
	var direction = global_position - character.global_position
	var distance = direction.length()
	direction = direction.normalized()
	
	var force = direction * gravity_str/(distance*distance + 10)

	#print_debug(force)
	character.velocity += force * get_process_delta_time() *forceMult
	if (distance < 1100) : character.velocity -= force*2
	if (distance < 1000) : character.velocity -= force*4
	if (distance < 1200) : character.velocity += force
	
	
			
			
	#print_debug(character.velocity)

func _ready() -> void:
	self.get_child(0).get_child(1).texture = load(sprite)
	self.get_child(0).contact_monitor = true
	self.get_child(0).max_contacts_reported += 2
	pass
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = global_position - player.global_position
	var distance = direction.length()
	
	
	#print_debug(distance)
	if(distance < abs(contactDist)):
		print_debug("HITTING")
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	if(distance < 8000):
		apply_gravity(player)
	
	
