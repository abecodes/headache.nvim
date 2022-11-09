local utils = require('headache.utils')
--[[
fileheader option should look like

	go = {
		text = "", -- header text
		template = "", -- path to header file, overwrites header
		ensure = false,
	}
--]]

---@class FileHeadersOptions
---@field text string
---@field template string
---@field ensure boolean

---@class FileHeader
---@field content string
---@field ensure true
---@field length number

local M = {}

M.name = 'headache.nvim'

--- @type FileHeader
M.opts = {}
M.debug = true

---setup plugin
---@param opts FileHeadersOptions
M.setup = function(opts)
	for k,v in pairs(opts) do
		local header = ''
		local ensure = false

		if not utils.str_is_empty(v.text) and utils.str_is_empty(v.template) then
			header = utils.split(v.text, '\n')
		end

		if not utils.str_is_empty(v.template) then
			header = vim.fn.readfile(vim.fn.expand(v.template))
		end

		if utils.str_is_empty(header) then
			goto continue
		end

		table.insert(header, '')

		if v.ensure then
			ensure = true
		end

		local length = 0
		for _ in pairs(header) do
			length = length + 1
		end

		M.opts[k] = {
			content = header,
			ensure = ensure,
			length = length,
		}

		::continue::
	end
end

return M
