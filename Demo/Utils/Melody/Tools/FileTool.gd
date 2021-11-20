extends Node


static func get_full_path(path, str_temp):
	var _path = ""
	if path.find("/") == 0:
		_path = str_temp % path.substr(1, path.length())
	else:
		_path = str_temp % path.substr(0, path.length())
	return _path


static func add_dir_contents(dir, files, dir_root, suffix, directories=[]):
	var file_name = dir.get_next()
	while (file_name != ""):
		var path = dir.get_current_dir() + "/" + file_name
		if dir.current_is_dir():
			var subDir = Directory.new()
			subDir.open(path)
			subDir.list_dir_begin(true, false)
			directories.append(path)
			add_dir_contents(subDir, files, dir_root, suffix, directories)
		else:
			var _path = path.split(dir_root)[1].split(suffix)[0]
			files.append(_path)
		file_name = dir.get_next()
	dir.list_dir_end()
