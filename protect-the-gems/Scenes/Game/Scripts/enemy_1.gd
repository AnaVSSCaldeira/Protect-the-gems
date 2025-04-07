extends CharacterBody2D

const speed = 50
# @export var gem: XXX
@onready var nav_agent = $NavigationAgent2D

func _physics_process(_delta):
    var dir = to_local(nav_agent.get_next_path_position()).normalized()
    velocity = dir * speed
    move_and_slide()

func make_path():
    # nav_agent.target_position = gem.global_position
    pass

func _on_timer_timeout():
    make_path()
