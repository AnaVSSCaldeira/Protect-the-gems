extends Node2D

@export var weapon_price: int = 0
@export var shop_items: Array = []

func _on_shop_exit_pressed():
	visible = false

func update_shop():
	shop_items = $"/root/Global".shop()
	if shop_items.size() > 0: # and shop_items[0] != null
		$"Armas/Name".text = shop_items[0].name
		$"Armas/Money_symbol/Price".text = str(shop_items[0].price)
		weapon_price = shop_items[0].price
		$Armas/Description.text = str(shop_items[0].description)
	else:
		$"Armas/Name".text = ""
		$"Armas/Money_symbol/Price".text = ""
		weapon_price = 0
		$Armas/Description.text = ""

func _ready():
	update_shop()

func _on_buy_pressed():
	if $"/root/Global".player_money >= weapon_price:
		var weapon = shop_items[0]
		$"/root/Global".current_weapon = load(weapon["image"])
		$"/root/Global".weapon_damage = weapon["damage"]
		$"/root/Global".stun_time = weapon["stun_time"]
		# colocar a imagem da arma
		$"/root/Global".weapon_id += 1
		$"/root/Global".player_money -= weapon_price
		var money = $"/root/Global".player_money
		get_parent().get_node("Money").get_node("Count").text = str(money)

		update_shop()
