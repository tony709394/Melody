extends "../Abstraction/Persistence.gd"


const dir_root = "user://RES"
const suffix = ".res"
const str_temp = "user://RES/%s.res"
const FileTool = preload("../Tools/FileTool.gd")


# ======================== API ========================

static func GET(path):
	var _path = FileTool.get_full_path(path, str_temp)
	return ResourceLoader.load(_path)


static func SET(resource, path):
	# make_dir_recursive() does not empty existing files
	var _path = FileTool.get_full_path(path, str_temp)
	var dir = Directory.new()
	dir.make_dir_recursive(_path.get_base_dir())
	var err = ResourceSaver.save(_path, resource)
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
