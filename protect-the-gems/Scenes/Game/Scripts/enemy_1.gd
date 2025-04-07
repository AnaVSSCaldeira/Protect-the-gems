extends CharacterBody2D

const speed = 100
@onready var gem
@onready var nav_agent = $NavigationAgent2D

func _ready():
	gem = get_parent().Return_Gems()
	make_path()
	print(gem)

func _physics_process(_delta):
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func make_path():
	nav_agent.target_position = gem.global_position

func _on_timer_timeout():
	make_path()
