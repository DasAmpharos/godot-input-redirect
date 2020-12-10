extends Node

var idx := 0
var acc := 0.0
var buttons := [
	N3DS.Button.RIGHT,
	N3DS.Button.DOWN,
	N3DS.Button.LEFT,
	N3DS.Button.UP
]

func _ready():
	Channel.connect_to_host("10.0.0.37", 4950)
	Channel.send_update()

#func _process(delta: float):
#	acc += delta
#	if acc >= 0.1:
#		N3DS.clear_buttons()
#		N3DS.clear_axis(N3DS.Axis.LS)
#		N3DS.clear_axis(N3DS.Axis.RS)
#		N3DS.press(buttons[idx])
#		Channel.send_update()
#
#		idx += 1
#		if idx >= buttons.size():
#			idx = 0
#		acc = 0

func _exit_tree():
	N3DS.clear_buttons()
	N3DS.clear_axis(N3DS.Axis.LS)
	N3DS.clear_axis(N3DS.Axis.RS)
	Channel.send_update()
