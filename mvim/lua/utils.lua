function get_selection()
	vim.cmd('normal! gv"xy')
	local txt = vim.fn.getreg("x")
	local tbl = {}
	for line in txt:gmatch("[^\n]+") do
		table.insert(tbl, line)
	end
	return tbl
end
