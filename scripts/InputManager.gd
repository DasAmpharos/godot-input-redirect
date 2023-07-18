extends Node

signal axis_moved(axis)
signal button_pressed(button)
signal button_released(button)

var _mappings := {}

func _ready():
	set_process_input(true)
#	pass

func _process(_delta: float):
	N3DS.clear_axis(N3DS.Axis.LS)
	N3DS.update_button(N3DS.Buttons.A, Input.is_action_pressed("n3ds_a"))
	N3DS.update_button(N3DS.Buttons.B, Input.is_action_pressed("n3ds_b"))
	N3DS.update_button(N3DS.Buttons.X, Input.is_action_pressed("n3ds_x"))
	N3DS.update_button(N3DS.Buttons.Y, Input.is_action_pressed("n3ds_y"))
	var axis = Vector2(Input.get_joy_axis(0, 0), -Input.get_joy_axis(0, 1))
	if axis != Vector2.ZERO:
		N3DS.update_axis(N3DS.Axis.LS, axis)
	if Input.is_action_pressed("n3ds_up"):
		N3DS.update_axis(N3DS.Axis.LS, -Vector2.UP)
	if Input.is_action_pressed("n3ds_down"):
		N3DS.update_axis(N3DS.Axis.LS, -Vector2.DOWN)
	if Input.is_action_pressed("n3ds_left"):
		N3DS.update_axis(N3DS.Axis.LS, Vector2.LEFT)
	if Input.is_action_pressed("n3ds_right"):
		N3DS.update_axis(N3DS.Axis.LS, Vector2.RIGHT)
	
#	N3DS.update_button(N3DS.Button.UP, Input.is_action_pressed("n3ds_up"))
#	N3DS.update_button(N3DS.Button.DOWN, Input.is_action_pressed("n3ds_down"))
#	N3DS.update_button(N3DS.Button.LEFT, Input.is_action_pressed("n3ds_left"))
#	N3DS.update_button(N3DS.Button.RIGHT, Input.is_action_pressed("n3ds_right"))
	N3DS.update_button(N3DS.Buttons.START, Input.is_action_pressed("n3ds_start"))
	N3DS.update_button(N3DS.Buttons.SELECT, Input.is_action_pressed("n3ds_select"))
	N3DS.update_button(N3DS.Buttons.L, Input.is_action_pressed("n3ds_l"))
	N3DS.update_button(N3DS.Buttons.ZL, Input.is_action_pressed("n3ds_zl"))
	N3DS.update_button(N3DS.Buttons.R, Input.is_action_pressed("n3ds_r"))
	N3DS.update_button(N3DS.Buttons.ZR, Input.is_action_pressed("n3ds_zr"))
	if Input.is_action_pressed("n3ds_reset"):
		N3DS.press(N3DS.Buttons.L)
		N3DS.press(N3DS.Buttons.R)
		N3DS.press(N3DS.Buttons.START)

#	N3DS.update_axis(N3DS.Axis.LS, Vector2(Input.get_joy_axis(0, 0), -Input.get_joy_axis(0, 1)))
#	N3DS.update_axis(N3DS.Axis.RS, Vector2(Input.get_joy_axis(0, 2), -Input.get_joy_axis(0, 3)))
#	pass
