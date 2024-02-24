extends AudioStreamPlayer2D

func _ready():
	pass 


func _process(delta):
	pass
	

   
func check_key_input():
	if Input.is_action_pressed("left"):
		if $Walk.playing == false:
			$Walk.play()

	if Input.is_action_pressed("right"):
		if $Walk.playing == false:
				$Walk.play()
			

