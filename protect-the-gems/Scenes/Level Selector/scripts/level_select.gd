extends Node2D

@onready var lvl_desc = $Level_desc
var final_json
var label

func _ready():
	label = lvl_desc.get_node("Label")
	var file = FileAccess.open("res://Scenes/Level Selector/Jsons/Levels_desc.json", FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	final_json = json.parse_string(content)

func read_json(key: String):
	print((final_json.level_description)[key]["title"])
	return (final_json.level_description)[key]["title"]+"\n"+(final_json.level_description)[key]["description"]

func _on_lvl_1_pressed():
	var x = read_json("level_1")
	label.text = x
	lvl_desc.visible = true

func _on_close_pressed():
	lvl_desc.visible = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/Scenes/Level_1.tscn")
