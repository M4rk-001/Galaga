extends CharacterBody2D

@export var speed : float = 400

@onready var current_weapon = $Weapon

@export var max_hp : float = 10
var current_hp : float

@export var collision_damage = 5



signal health_change(current, max)
signal player_died


func _ready():
	current_hp = max_hp
	health_change.emit(current_hp,max_hp)
func _process(delta):
	if Input.is_action_pressed("shoot"):
		current_weapon.shoot()

func _physics_process(delta):
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * speed
	
	move_and_slide()
	
func take_damage(damage):
	current_hp -= damage
	current_hp = clamp(current_hp,0,max_hp)
	health_change.emit(current_hp,0,max_hp)
	if current_hp <= 0 :
		die()

func die():
	#explosion
	player_died.emit()
	
	queue_free()
