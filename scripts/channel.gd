extends Node

var _acc := 0.0
var send_interval := 0.05 setget set_send_interval, get_send_interval
var socket = PacketPeerUDP.new()

const SEND_INTERVAL := "application/send_interval"

func _ready():
	ProjectSettings.set_initial_value(SEND_INTERVAL, 0.05)
	if ProjectSettings.has_setting(SEND_INTERVAL):
		send_interval = ProjectSettings.get_setting(SEND_INTERVAL)

func _process(delta: float):
	_acc += delta
	if _acc >= send_interval:
		_acc = 0

func connect_to_host(host: String, port: int):
	return socket.connect_to_host(host, port)

func set_send_interval(send_interval: float):
	ProjectSettings.set_setting(SEND_INTERVAL, send_interval)
	self.send_interval = send_interval

func get_send_interval() -> float:
	return send_interval

func _exit_tree():
	socket.close()
