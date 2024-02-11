extends Camera2D

@export var tilemap: TileMap

func _ready():
	# ---Camera can only stay in the map--- 
	var visibleArea 		= tilemap.get_used_rect()
	var tileSize 			= tilemap.rendering_quadrant_size
	var upperLeftCorner 	= visibleArea.position * tileSize
	var lowerRightCorner 	= (visibleArea.position + visibleArea.size) * tileSize
	   
	limit_left 				= tilemap.position.x + upperLeftCorner.x
	limit_top 				= tilemap.position.y + upperLeftCorner.y
	limit_right 			= tilemap.position.x + lowerRightCorner.x
	limit_bottom 			= tilemap.position.y + lowerRightCorner.y
	# -------


func _process(_delta):
	pass
