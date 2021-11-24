extends Node


const scn = preload("./SCN/SCN.gd")
const res = preload("./RES/RES.gd")
const struct = preload("./Struct/Struct.gd")
var password


func _init():
	var user_path = ProjectSettings.globalize_path("user://")
	print("[Melody] Ready!")
	print("[Melody] Storage path: %s" % user_path)


func encrypt(_password):
	if password == null:
		password = _password
		return true
	return false
