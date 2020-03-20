extends Control

func _ready():
	pass # Replace with function body.
	

func set_score(var p1, var p2):
	print(p1, " ", p2)
	
func show_end(var result):
	if result == 0:
		print("Draw")
	elif result == 1:
		print("Player 1 win!")
	elif result == 2:
		print("Player 2 win!")
