extends Node

signal jumps_changed()

var jumps = 0:
	set(value):
		jumps = value
		jumps_changed.emit()


var meh = {
	"name": "meh",
	"attack": 12,
	"luck": "no"
}

var data = {}

var attack = 0


@onready var label: Label = $Label


func _ready() -> void:
	load_game()
	#label.text = str(attack)

func save_game():
	#var data_string = JSON.stringify(meh)
	#var file = FileAccess.open("user://data.json", FileAccess.WRITE)
	#var file = FileAccess.open_encrypted_with_pass("user://data.save", FileAccess.WRITE, "meh")
	#file.store_string(data_string)
	
	# save only data
	#file.store_var("meh")
	#file.store_var(12)
	#file.store_var("no")
	
	# save data of all nodes in group save
	data = {}
	for node in get_tree().get_nodes_in_group("save"):
		var node_data = node.get_data()
		data[node.id] = node_data
	var file = FileAccess.open("user://data.save", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))


func load_game():
	#var file = FileAccess.open("user://data.json", FileAccess.READ)
	#var file = FileAccess.open_encrypted_with_pass("user://data.save", FileAccess.READ, "meh")
#
	#var data_string = file.get_as_text()
	#var data_json = JSON.parse_string(data_string)
	#attack = data_json.attack
	
	# get only data
	#var name_data = file.get_var()
	#var attack = file.get_var()
	#var luck = file.get_var()
	
	# load data of all nodes in group save
	var file = FileAccess.open("user://data.save", FileAccess.READ)
	data = JSON.parse_string(file.get_as_text())
	
