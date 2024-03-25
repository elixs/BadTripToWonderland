extends PanelContainer

@onready var resume: Button = %Resume
@onready var options: Button = %Options
@onready var main_menu: Button = %MainMenu
@onready var quit: Button = %Quit


func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	quit.pressed.connect(_on_quit_pressed)
	
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused


func _on_resume_pressed():
	get_tree().paused = false
	hide()


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
