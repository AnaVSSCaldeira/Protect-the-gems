extends CharacterBody2D

const speed = 100
var attack = false
@onready var gem
@onready var nav_agent = $NavigationAgent2D

func _ready():
	gem = get_parent().call_parent()
	make_path()

func _physics_process(_delta):
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func make_path():
	nav_agent.target_position = gem.global_position

func _on_timer_timeout():
	make_path()

func _on_area_2d_mouse_entered():
	attack = true

func _on_area_2d_mouse_exited():
	attack = false

func _input(event):
	if event.is_action_pressed("Click") and attack == true:
		$Life.value = $Life.value - int($"/root/Global".weapon_damage)
	if $Life.value == 0:
		queue_free()
