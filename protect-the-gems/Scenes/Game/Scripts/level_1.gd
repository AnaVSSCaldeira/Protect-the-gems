extends Node2D

@onready var child_gem

func Return_Gems():
    child_gem = $Gems
    return child_gem