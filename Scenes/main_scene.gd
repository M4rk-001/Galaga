extends Node2D

var points : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ui.update_point(points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_health_change(current, max):
	$Ui.update_health(current, max)
	print(current)


func _on_player_player_died():
	$Ui.show_player_died()
	
	
func _on_enemy_died():
	points+=1
	$Ui.update_point(points)


func _on_map_enemy_spawned(enemy: Variant) -> void:
	enemy.enemy_died.connect(_on_enemy_died)
