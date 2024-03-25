extends MarginContainer

@onready var start: Button = %Start
@onready var options: Button = %Options
@onready var credits: Button = %Credits
@onready var quit: Button = %Quit


func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	quit.pressed.connect(_on_quit_pressed)


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_pressed():
	get_tree().quit()
