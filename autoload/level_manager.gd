extends Node

@export var levels: Array[PackedScene] = []
var current_level = -1
const MAIN_MENU = preload("res://ui/main_menu.tscn")

var id = "level_manager"

func _ready() -> void:
	# load data
	if id in Game.data:
		current_level = Game.data[id].level

func next_level():
	if current_level < levels.size() - 1:
		current_level +=1
		get_tree().change_scene_to_packed(levels[current_level])
	else:
		go_to_main_menu()


func go_to_main_menu():
	get_tree().change_scene_to_packed(MAIN_MENU)


func get_data():
	var data = {
		"level": current_level - 1
	}
	return data
