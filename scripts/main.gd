extends Node

func _ready():
	Channel.connect_to_host("10.0.0.26", 4950)
	Channel.send_update()

func _exit_tree():
	N3DS.clear_buttons()
	N3DS.clear_axis(N3DS.Axis.LS)
	N3DS.clear_axis(N3DS.Axis.RS)
	Channel.send_update()
