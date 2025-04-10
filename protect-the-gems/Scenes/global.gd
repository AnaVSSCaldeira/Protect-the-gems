extends Node

#informacoes do player
@export var current_weapon: CompressedTexture2D = load("res://icon.svg")
@export var weapon_damage: int = 1
@export var stun_chance: int = 5
@export var money: int = 0

#informacoes do jogo
@export var progress: Node2D

#waves de inimigos
var final_json

func read_json_waves():
    var file = FileAccess.open("res://Scenes/Game/jsons/waves.json", FileAccess.READ)
    var content = file.get_as_text()
    var json = JSON.new()
    final_json = json.parse_string(content)
    return final_json