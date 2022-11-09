local utils = require('headache.utils')
local config = require('headache.config')
local api = vim.api

---@class FileHeaders
local M = {}

--- @param opts FileHeadersOptions
M.setup = function(opts)
	-- initializing the plugin
	config.setup(opts)

	for k,header in pairs(config.opts) do
		-- setting eventlisteners
		utils.new_autocmd('BufNewFile, BufNew', 'codes.abe.headache.'..k, {
			pattern = '*.'..k,
			callback = function()
				api.nvim_buf_set_lines(
					api.nvim_get_current_buf(),
					0,
					0,
					false,
					header.content
				)
			end
		})

		if header.ensure then
			utils.new_autocmd('BufEnter', 'codes.abe.headache.'..k, {
				pattern = '*.'..k,
				callback = function()
					local currHeader = api.nvim_buf_get_lines(
						api.nvim_get_current_buf(),
						0,
						header.length,
						false
					)

					local noMatch = false

					for i,line in pairs(currHeader) do
						if not (line == header.content[i]) then
							noMatch = true
							break
						end
					end

					if noMatch then
					api.nvim_buf_set_lines(
						api.nvim_get_current_buf(),
						0,
						0,
						false,
						header.content
					)
					end
				end
			})
		end
end

return M
