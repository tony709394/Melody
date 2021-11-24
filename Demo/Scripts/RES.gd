extends Spatial


onready var monkey = $Monkey
onready var i_mesh = $MeshInstance
var mesh


func _ready():
	mesh = monkey.mesh
	
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
		var success = Melody.res.SET(mesh, "/mesh/monkey")
		print("SET")
		print(success)
		print("=======================")
	
	# GET() shortcut key 2
	if Input.is_action_pressed("ui_2"):
		var res_mesh = Melody.res.GET("/mesh/monkey")
		print("GET")
		print(res_mesh)
		print("=======================")
		i_mesh.mesh = res_mesh
	
	# DELETE() shortcut key 3
	if Input.is_action_pressed("ui_3"):
		var success = Melody.res.DELETE("/mesh/monkey")
		print("DELETE")
		print(success)
		print("=======================")
	
	# has() shortcut key 4
	if Input.is_action_pressed("ui_4"):
		var success = Melody.res.has("/mesh/monkey")
		print("has")
		print(success)
		print("=======================")
	
	# list() shortcut key 5
	if Input.is_action_pressed("ui_5"):
		var array_path = Melody.res.list()
		print("list")
		print(array_path)
		print("=======================")
	
	# clean() shortcut key 6
	if Input.is_action_pressed("ui_6"):
		var success = Melody.res.clean()
		print("clean")
		print(success)
		print("=======================")
