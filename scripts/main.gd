extends Node

func _ready():
	N3DS.press(N3DS.Button.A)
	print(N3DS.is_pressed(N3DS.Button.A))
	N3DS.release(N3DS.Button.A)
	print(N3DS.is_pressed(N3DS.Button.A))
