extends Node2D

@export var weapon_price: int = 0

func _on_shop_exit_pressed():
	visible = false

func update_shop():
	var shop_items = $"/root/Global".shop()
	if shop_items[0] != null:
		$"Armas/Name".text = shop_items[0].name
		$"Armas/Money_symbol/Price".text = str(shop_items[0].price)
		weapon_price = shop_items[0].price
		$Armas/Description.text = str(shop_items[0].description)

func _ready():
	update_shop()


func _on_buy_pressed():
	if $"/root/Global".player_money >= weapon_price:
		if $"/root/Global".weapon_id < 4:
			$"/root/Global".weapon_id += 1
			$"/root/Global".player_money -= weapon_price
			var money = $"/root/Global".player_money
			get_parent().get_node("Money").get_node("Count").text = str(money)
			update_shop()
