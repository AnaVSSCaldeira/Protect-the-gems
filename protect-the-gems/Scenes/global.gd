extends Node

#informacoes do player
@export var current_weapon: CompressedTexture2D = load("res://icon.svg")
@export var weapon_damage: int = 1
@export var stun_chance: int = 5
@export var money: int = 0

#informacoes do jogo
@export var progress: Node2D