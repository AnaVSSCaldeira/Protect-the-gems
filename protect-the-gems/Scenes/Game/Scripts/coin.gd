extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
var speed = 800

func _process(delta):
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func destroy():
	queue_free()

func _ready():
	var parent = get_parent()
	nav_agent.target_position = (parent.get_parent().get_node("Money").get_node("Count")).global_position
