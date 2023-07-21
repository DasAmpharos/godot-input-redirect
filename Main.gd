extends Node

func _process(delta):
	var packet := PacketFactory.create_packet(N3DS.buttons, Vector2(N3DS.ls), Vector2(N3DS.rs))
	for channel in ChannelManager.channels:
		channel.send_packet(packet)
