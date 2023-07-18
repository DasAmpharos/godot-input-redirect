extends Node

var buttons := 0
var ls := Vector2.ZERO
var rs := Vector2.ZERO

func press(button: int):
	buttons = buttons | (1 << button)

func release(button: int):
	buttons = buttons & ~(1 << button)

func clear_buttons():
	buttons = 0

func update_button(button: int, pressed: bool):
	if pressed:
		press(button)
	else:
		release(button)

func is_pressed(button: int) -> bool:
	return (buttons >> button) & 1 == 1

func update_axis(axis: int, pos: Vector2):
	match axis:
		Axis.LS:
			ls = pos
		Axis.RS:
			rs = pos

func update_axis_x(axis: int, x: float):
	match axis:
		Axis.LS:
			ls = Vector2(x, ls.y)
		Axis.RS:
			rs = Vector2(x, rs.y)

func update_axis_y(axis: int, y: float):
	match axis:
		Axis.LS:
			ls = Vector2(ls.x, y)
		Axis.RS:
			rs = Vector2(rs.x, y)

func clear_axis(axis: int):
	match axis:
		Axis.LS:
			ls = Vector2(0.0, 0.0)
		Axis.RS:
			rs = Vector2(0.0, 0.0)

func get_axis(axis: int) -> Vector2:
	match axis:
		Axis.LS:
			return ls
		Axis.RS:
			return rs
		_:
			return Vector2.ZERO

enum Axis {
	LS, RS
}

enum Buttons {
	A, B, SELECT, START,
	RIGHT, LEFT, UP, DOWN,
	R, L, X, Y, ZR, ZL,
	HOME
}
