extends Spatial


func _ready():
	pass


func _input(event):
	
	# SET() shortcut key 1
	if Input.is_action_pressed("ui_1"):
		var array_dict = [
			{ "name": "happy", "want": "enjoy food", "positivity": 10 },
			{ "name": "sad", "want": "calm down", "positivity": 2 },
			{ "name": "normal", "want": "sleep", "positivity": 6 },
		]
		var success = Melody.struct.SET(array_dict, "/player/mood")
		print("SET")
		print(success)
		print("=======================")
	
	# GET() shortcut key 2
	if Input.is_action_pressed("ui_2"):
		var array_dict = Melody.struct.GET("/player/mood")
		print("GET")
		print(array_dict)
		print("=======================")
	
	# DELETE() shortcut key 3
	if Input.is_action_pressed("ui_3"):
		var success = Melody.struct.DELETE("/player/mood")
		print("DELETE")
		print(success)
		print("=======================")
	
	# has() shortcut key 4
	if Input.is_action_pressed("ui_4"):
		var success = Melody.struct.has("/player/mood")
		print("has")
		print(success)
		print("=======================")
	
	# list() shortcut key 5
	if Input.is_action_pressed("ui_5"):
		var array_path = Melody.struct.list()
		print("list")
		print(array_path)
		print("=======================")
	
	# clean() shortcut key 6
	if Input.is_action_pressed("ui_6"):
		var success = Melody.struct.clean()
		print("clean")
		print(success)
		print("=======================")
