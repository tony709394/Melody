extends "../Abstraction/Persistence.gd"


const dir_root = "user://Struct"
const suffix = ".cfg"
const str_temp = "user://Struct/%s.cfg"
const FileTool = preload("../Tools/FileTool.gd")
const StringTool = preload("../Tools/StringTool.gd")


# ======================== API ========================

static func GET(path):
	var res_array_dict = []
	var config = ConfigFile.new()
	var _path = FileTool.get_full_path(path, str_temp)
	
	var err
	var password = Melody.password
	if password == null:
		err = config.load(_path)
	else:
		err = config.load_encrypted_pass(_path, password)
	
	if err == OK:
		var sections = config.get_sections()
		var array_key = []
		for i in range(sections.size()):
			var current_section = sections[i]
			var item = {}
			if i == 0:
				array_key = config.get_section_keys(current_section)
			for key in array_key:
				item[key] = config.get_value(current_section, key)
			res_array_dict.append(item)
	return res_array_dict


static func SET(array_dict, path):
	# make_dir_recursive() does not empty existing files
	var _path = FileTool.get_full_path(path, str_temp)
	var dir = Directory.new()
	dir.make_dir_recursive(_path.get_base_dir())
	
	var config = ConfigFile.new()
	for item in array_dict:
		var id = StringTool.generate_random_string(16)
		for key in item:
			config.set_value(id, key, item[key])
	
	var err
	var password = Melody.password
	if password == null:
		err = config.save(_path)
	else:
		err = config.save_encrypted_pass(_path, password)
	
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
