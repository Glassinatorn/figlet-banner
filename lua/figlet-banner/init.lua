local function banner(...)
    -- TODO: 
    -- make popup window which asks for content of the banner []
    -- document the code []
    -- make sure it is possible to run the code when imported through packer []
    local banner = vim.fn.systemlist("figlet -f ~/freetime/figlet/poison.flf " .. ...)
    local comments = {}
    comments["vim"] = {' ','"','"','"','"','"','"','"','"','"','"'}
    comments["tex"] = {' ','%','%','%','%','%','%','%','%','%','%'}
    comments["sh"] = {' ','#','#','#','#','#','#','#','#','#','#'}
    comments["lua"] = {' ','--','--','--','--','--','--','--','--','--','--'}

    vim.api.nvim_put(banner, "b", false, false)
    local filetype = vim.api.nvim_exec(":echo &filetype", true)


    if ((filetype):find "vim") ~= nil then
	vim.api.nvim_put(comments["vim"], "b", false, false)
    elseif (filetype):find "tex" ~= nil then
      vim.api.nvim_put(comments["tex"], "b", false, false)
    elseif (filetype):find "sh" ~= nil then
      vim.api.nvim_put(comments["sh"], "b", false, false)
    elseif (filetype):find "lua" ~= nil then
	vim.api.nvim_put(comments["lua"], "b", false, false)
    end
end

return {
    banner = banner
}
