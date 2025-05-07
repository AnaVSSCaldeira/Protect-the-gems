extends Node2D

func _on_shop_exit_pressed():
	visible = false

func _ready():
	var shop_items = $"/root/Global".shop()
	$"Bg/Bg armas/Name".text = shop_items[0].name
	$"Bg/Bg armas/Price".text = str(shop_items[0].price)
