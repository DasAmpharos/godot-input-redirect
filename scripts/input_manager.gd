extends Node

signal axis_moved(axis)
signal button_pressed(button)
signal button_released(button)

var _mappings := {}

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_UP:
			N3DS.update_button(N3DS.Button.UP, event.pressed)
		elif event.scancode == KEY_DOWN:
			N3DS.update_button(N3DS.Button.DOWN, event.pressed)
		elif event.scancode == KEY_LEFT:
			N3DS.update_button(N3DS.Button.LEFT, event.pressed)
		elif event.scancode == KEY_RIGHT:
			N3DS.update_button(N3DS.Button.RIGHT, event.pressed)
