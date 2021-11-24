extends Spatial


onready var node_inserted = $Node


func _ready():
	pass
	
#	# true
#	var success1 = Melody.encrypt("123456")
#	print(success1)
#
#	# false
#	# Global password can only be set once to prevent previously saved files from being unreadable
#	var success2 = Melody.encrypt("654321")
#	print(success2)


func _input(event):
	
	# SET() shortcut key 1
	if Input.is_action_pressed("ui_1"):
		var success = Melody.scn.SET(self, "/tree/tree1")
		print("SET")
		print(success)
		print("=======================")
	
	# GET() shortcut key 2
	if Input.is_action_pressed("ui_2"):
		var node = Melody.scn.GET("/tree/tree1")
		print("GET")
		print(node)
		print("=======================")
		node_inserted.add_child(node)
	
	# DELETE() shortcut key 3
	if Input.is_action_pressed("ui_3"):
		var success = Melody.scn.DELETE("/tree/tree1")
		print("DELETE")
		print(success)
		print("=======================")
	
	# has() shortcut key 4
	if Input.is_action_pressed("ui_4"):
		var success = Melody.scn.has("/tree/tree1")
		print("has")
		print(success)
		print("=======================")
	
	# list() shortcut key 5
	if Input.is_action_pressed("ui_5"):
		var array_path = Melody.scn.list()
		print("list")
		print(array_path)
		print("=======================")
	
	# clean() shortcut key 6
	if Input.is_action_pressed("ui_6"):
		var success = Melody.scn.clean()
		print("clean")
		print(success)
		print("=======================")
