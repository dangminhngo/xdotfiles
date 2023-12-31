local pal = require("theme.palette")
local templates = require("theme.templates")

return function(dir)
	local config_dir = dir
	os.execute("mkdir -p " .. config_dir)

	for _, tpl in pairs(templates) do
		local template_content = tpl.gen(pal)
		local dir_path = config_dir .. "/" .. tpl.path
		os.execute("mkdir -p " .. dir_path)
		local file_path = dir_path .. "/" .. tpl.filename
		local file = io.open(file_path, "w")
		if file then
			io.output(file)
			io.write(template_content)
			io.close(file)
			print("Generate template for '" .. tpl.name .. "' ... Success")
		else
			print("Generate template for '" .. tpl.name .. "' ... Failed")
		end
	end
end
