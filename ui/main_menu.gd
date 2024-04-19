extends MarginContainer

@onready var start: Button = %Start
@onready var options: Button = %Options
@onready var credits: Button = %Credits
@onready var quit: Button = %Quit


func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	quit.pressed.connect(_on_quit_pressed)
	start.grab_focus()


func _on_start_pressed():
	LevelManager.next_level()


func _on_quit_pressed():
	get_tree().quit()
