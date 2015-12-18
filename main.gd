extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var index = 0
export var rotation = .1
func _ready():
	#Initialization here
	set_process_input(true)
	set_fixed_process(true)
	#Play the sound this also can be replaced by simply setting the autoplay property to true.
	get_node("StreamPlayer").play()
	#Set window title
	OS.set_window_title("Just A Game Menu")
	#Hide mouse.
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _fixed_process(delta):
	get_node("SmallerCircle").set_rot(get_node("SmallerCircle").get_rot() + rotation * delta)
	get_node("Circle").set_rot(get_node("Circle").get_rot() - rotation * delta)

func _input(event):
	if event.is_action("btn_up") && event.is_pressed() && !event.is_echo():
		if(index != 0):
			index -= 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y - 90
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("btn_down") && event.is_pressed() && !event.is_echo():
		if(index != 3):
			index += 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y + 90
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("btn_return") && event.is_pressed() && !event.is_echo():
		if (index == 0):
			print("New Game")
		if (index == 1):
			print("Options")
		if (index == 2):
			print("Credits")	
		if(index == 3):
			OS.get_main_loop().quit()