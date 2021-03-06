extends "../Abstraction/Persistence.gd"


const dir_root = "user://SCN"
const suffix = ".scn"
const str_temp = "user://SCN/%s.scn"
const FileTool = preload("../Tools/FileTool.gd")


# ======================== API ========================

static func GET(path):
	var _path = FileTool.get_full_path(path, str_temp)
	
	var res_load
	var password = Melody.password
	if password == null:
		res_load = ResourceLoader.load(_path)
	else:
		var file = File.new()
		var err = file.open_encrypted_with_pass(_path, File.READ, password)
		if err == OK:
			res_load = file.get_var(true)
		file.close()
	
	return res_load.instance()


static func SET(node, path):
	var scene = PackedScene.new()
	_set_owner(node, node)
	scene.pack(node)
	# make_dir_recursive() does not empty existing files
	var _path = FileTool.get_full_path(path, str_temp)
	var dir = Directory.new()
	dir.make_dir_recursive(_path.get_base_dir())
	
	var err
	var password = Melody.password
	if password == null:
		err = ResourceSaver.save(_path, scene)
	else:
		var file = File.new()
		var err_file = file.open_encrypted_with_pass(_path, File.WRITE, password)
		if err_file == OK:
			file.store_var(scene, true)
			err = OK
		else:
			err = -1
		file.close()
	
	return true if err == OK else false


static func DELETE(path):
	return _DELETE(path, str_temp)


static func has(path):
	return _has(path, str_temp)


static func list():
	return _list(dir_root, suffix)


static func clean():
	return _clean(dir_root, suffix, str_temp)

# ======================== API ========================


# the owner of each child node is the top-level node
static func _set_owner(node_current, root):
	if node_current != root:
		node_current.owner = root
	for node_child in node_current.get_children():
		_set_owner(node_child, root)
