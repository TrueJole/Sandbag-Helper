extends Label

@export var x_coordinate: int
@export var y_coordinate: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $"../../../../..".get_parent().sandbags[x_coordinate-1][y_coordinate-1]:
		visible = true
	else:
		visible = false
	print('Loaded:', visible)
	
