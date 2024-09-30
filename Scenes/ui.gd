extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_health(current,max):
	$HealthBar.max_value = max
	$HealthBar.value = current
	
	
func update_point(points):
	$PointsLabel.text = str(points)
	
func show_player_died():
	$PlayerDied.show()
