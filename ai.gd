extends Node

onready var game = get_node("..")
onready var map = get_node("../Map")
onready var gui = get_node("../GUI")
onready var cursor = get_node("../Cursor")

func make_step():
	randomize()
	var y = int(rand_range(0, 6))
	while map.map[y][cursor.x] == 0:
		y = int(rand_range(0, 6))
	var step = y - cursor.y
	for i in range(abs(step)):
		cursor.move(0, step/abs(step))
	cursor.select(2)
	

	
	
