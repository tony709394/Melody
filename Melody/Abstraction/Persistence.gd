extends Node


const _FileTool = preload("../Tools/FileTool.gd")


static func _DELETE(path, str_temp):
	# remove only delete file / empty dir
	var _path = _FileTool.get_full_path(path, str_temp)
	var dir = Directory.new()
	var err = dir.remove(_path)
	return true if err == OK else false


static func _has(path, str_temp):
	var file = File.new()
	var _path = _FileTool.get_full_path(path, str_temp)
	return file.file_exists(_path)


static func _list(dir_root, suffix):
	var files = []
	var dir = Directory.new()
	if dir.open(dir_root) == OK:
		dir.list_dir_begin(true, false)
		_FileTool.add_dir_contents(dir, files, dir_root, suffix)
	else:
		push_error("An error occurred when trying to access the path.")
	return files


static func _clean(dir_root, suffix, str_temp):
	var files = []
	var directories = []
	var dir = Directory.new()
	if dir.open(dir_root) == OK:
		dir.list_dir_begin(true, false)
		_FileTool.add_dir_contents(dir, files, dir_root, suffix, directories)
	else:
		return false
	for path_file in files:
		_DELETE(path_file, str_temp)
	for path_dir in directories:
		# remove only delete file / empty dir
		Directory.new().remove(path_dir)
	return true
