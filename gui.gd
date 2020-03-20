extends Control

onready var label_result = get_node("Message/Result")
onready var message = get_node("Message")
onready var label_p1 = get_node("VBoxContainer/HBoxContainer/P1")
onready var label_p2 = get_node("VBoxContainer/HBoxContainer/P2")


func _ready():
	pass # Replace with function body.
	

func set_score(var p1: int, var p2: int):
	label_p1.text = "P1 Score: " + str(p1)
	label_p2.text = "P2 Score: " + str(p2)
	
func show_end(var result):
	message.visible = true
	if result == 0:
		label_result.text = "Draw"
	elif result == 1:
		label_result.text = "Player 1 win!"
	elif result == 2:
		label_result.text = "Player 2 win!"
