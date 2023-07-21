extends Node
class_name Channel

@export var hostname: String
@export var port: int = 4950
@export var active: bool = true

var _socket = PacketPeerUDP.new()

func _ready():
	if active:
		_socket.connect_to_host(hostname, port)
		ChannelManager.register(self)

func send_packet(packet: PackedByteArray):
	_socket.put_packet(packet)

func _exit_tree():
	_socket.close()
