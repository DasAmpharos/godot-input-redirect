extends Node

var buttons := 0
var ls := Vector2.ZERO
var rs := Vector2.ZERO

func press(button: int):
	self.buttons = self.buttons | (1 << button)

func release(button: int):
	self.buttons = self.buttons & ~(1 << button)

func update_button(button: int, pressed: bool):
	if pressed:
		press(button)
	else:
		release(button)

func is_pressed(button: int) -> bool:
	return (self.buttons >> button) & 1 == 1

func update_axis(axis: int, pos: Vector2):
	match axis:
		Axis.LS:
			ls = pos
		Axis.RS:
			rs = pos

func update_axis_x(axis: int, x: float):
	match axis:
		Axis.LS:
			ls.x = x
		Axis.RS:
			rs.x = x

func update_axis_y(axis: int, y: float):
	match axis:
		Axis.LS:
			ls.y = y
		Axis.RS:
			rs.y = y

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

enum Button {
	A, B, SELECT, START,
	RIGHT, LEFT, UP, DOWN,
	R, L, X, Y, ZR, ZL,
	HOME
}
