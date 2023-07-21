extends Node

var channels = []

const Channel = preload("res://scripts/Channel.gd")

func register(channel: Channel):
	channels.append(channel)
