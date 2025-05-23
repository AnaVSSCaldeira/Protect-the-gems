extends Node

#informacoes do player
@export var current_weapon: CompressedTexture2D = load("res://Scenes/Game/Images/weapon.png")
@export var weapon_id: int = 0
@export var weapon_damage: int = 2
@export var stun_time: float = 0.5
@export var player_money: int = 0
@export var shop_list: Array = [{"name": "Holograma de gema", "buy": false}, {"name": "Mina de Stun", "buy": false}, {"name": "Congelamento", "buy": false}, {"name": "Lança Chamas", "buy": false}]

#informacoes do jogo
var finishied_waves = 0

#waves de inimigos
var final_json

func read_json(link):
	var file_json = FileAccess.open(link, FileAccess.READ)
	var content = file_json.get_as_text()
	var json = JSON.new()
	final_json = json.parse_string(content)
	return final_json

func read_json_waves(spawner_lists):
	final_json = read_json("res://Scenes/Game/jsons/waves.json")

	var level
	if(get_tree().current_scene):
		var level_number
		var file = get_tree().current_scene.scene_file_path.get_file()
		var handle_string_1 = file.split(".")
		var handle_string_2 = handle_string_1[0].split("_")
		var level_name = str((int(handle_string_2[1])))
		level_number = "level_"+level_name
		level = final_json[level_number]

	var wave_count = 1
	for wave in spawner_lists:
		var wave_information = level["wave_"+str(wave_count)]
		wave.enemies_list = wave_information["enemies_list"]
		wave.timer.set_wait_time(wave_information["waves_timer"])
		wave.timer.start()
		wave_count += 1

	return final_json

func shop():
	final_json = read_json("res://Scenes/Level Selector/Jsons/shop.json")

	var list = []
	#arma:
	if weapon_id < (final_json.weapons).size():
		list.append(final_json.weapons[(weapon_id)])
	return list