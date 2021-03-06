extends Node2D

var map = []
var field = []
onready var cell = load("res://cell.tscn")
onready var sprite_cell_blue = load("res://cell_blue.png")
onready var sprite_cell_red = load("res://cell_red.png")


func generate_map():
	for x in range(6):
		var col = []
		col.resize(6)
		map.append(col)

	for cell in range(-6, 7):
		if cell != 0:
			for i in range(3):
				while true:
					randomize()
					var temp_x = rand_range(0, 6)
					var temp_y = rand_range(0, 6)
					if map[temp_y][temp_x] == null:
						map[temp_y][temp_x] = cell
						break


func draw_map():
	for x in range(6):
		var col = []
		col.resize(6)
		field.append(col)
	for y in range(6):
		for x in range(6):
			field[y][x] = cell.instance()
			field[y][x].scale = Vector2(1.0 / 3.0, 1.0 / 3.0)
			field[y][x].position = Vector2(x * 120 + 60 + 280, y * 120 + 60)
			if map[y][x] < 0:
				field[y][x].texture = sprite_cell_red
			for node in field[y][x].get_children():
				if node is Node:
					node.text = str(abs(map[y][x]))
			add_child(field[y][x])


func delete_cell(x, y):
	if map[y][x] != 0:
		field[y][x].queue_free()
		map[y][x] = 0
		return true
	else:
		return false


func check_step(player, x, y):
	# y for player 1, x for player 2
	var check = false
	if player == 1:
		for x in range(6):
			if map[y][x] != 0:
				check = true
	elif player == 2:
		# for y in range(6):
		# 	if map[y][x] != 0:
		# 		check = true
		check = true
	return check


func _ready():
	generate_map()
	draw_map()
