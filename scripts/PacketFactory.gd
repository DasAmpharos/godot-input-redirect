extends Node

const CPAD_BOUND := 0x5d0

func create_packet(buttons: int, ls: Vector2, rs: Vector2) -> PackedByteArray:
	var hid_pad := 0xfff
	var circle_pad := 0x7ff7ff
	var touch_screen := 0x2000000
	var cpp := 0x80800081
	
	for button in N3DS.Buttons.values():
		if buttons & (1 << button) != 0:
			hid_pad &= ~(1 << button)
	
	if ls.x != 0 || ls.y != 0:
		var x := (ls.x * CPAD_BOUND) + 0x800
		var y := (ls.y * CPAD_BOUND) + 0x800
		if x >= 0xfff:
			if ls.x < 0.0:
				x = 0x000
			else:
				x = 0xfff
		if y >= 0xfff:
			if ls.y < 0.0:
				y = 0x000
			else:
				y = 0xfff
		circle_pad = (int(y) << 12) | int(x)
	
	var arr := PackedByteArray()
	arr.append_array(_to_little_endian(hid_pad))
	arr.append_array(_to_little_endian(touch_screen))
	arr.append_array(_to_little_endian(circle_pad))
	arr.append_array(_to_little_endian(cpp))
	arr.append_array(_pad(0, 4))
	return arr

func _to_little_endian(i: int) -> PackedByteArray:
	var arr := PackedByteArray()
	arr.append(i & 0xff)
	arr.append((i >> 8) & 0xff)
	arr.append((i >> 16) & 0xff)
	arr.append((i >> 24) & 0xff)
	return arr

func _pad(byte: int, n: int) -> PackedByteArray:
	var pad := PackedByteArray()
	for _i in range(n):
		pad.append(byte)
	return pad