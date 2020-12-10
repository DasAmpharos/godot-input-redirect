extends Node

signal axis_moved(axis)
signal button_pressed(button)
signal button_released(button)

var _mappings := {}

func _ready():
	set_process_input(true)

func _input(event):
	N3DS.update_button(N3DS.Button.A, event.is_action_pressed("n3ds_a"))
	N3DS.update_button(N3DS.Button.B, event.is_action_pressed("n3ds_b"))
	N3DS.update_button(N3DS.Button.X, event.is_action_pressed("n3ds_x"))
	N3DS.update_button(N3DS.Button.Y, event.is_action_pressed("n3ds_y"))
	
	N3DS.update_button(N3DS.Button.UP, event.is_action_pressed("n3ds_up"))
	N3DS.update_button(N3DS.Button.DOWN, event.is_action_pressed("n3ds_down"))
	N3DS.update_button(N3DS.Button.LEFT, event.is_action_pressed("n3ds_left"))
	N3DS.update_button(N3DS.Button.RIGHT, event.is_action_pressed("n3ds_right"))
