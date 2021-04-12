local function banner(...)
    -- TODO: 
    -- make popup window which asks for content of the banner []
    -- document the code [x]
    -- make sure it is possible to run the code when imported through packer []

    -- defining comment blocks to insert
    local comments = {}
    comments["vim"] = {' ','" ','" ','" ','" ','" ','" ','" ','" ','" ','" '}
    comments["tex"] = {' ','% ','% ','% ','% ','% ','% ','% ','% ','% ','% '}
    comments["sh"] =  {' ','# ','# ','# ','# ','# ','# ','# ','# ','# ','# '}
    comments["lua"] = {' ','-- ','-- ','-- ','-- ','-- ','-- ','-- ','-- ','-- ','-- '}

    -- generating textblock with figlet
    local banner = vim.fn.systemlist("figlet -f ~/freetime/figlet/poison.flf " .. ...)
    -- quering filetype info
    local filetype = vim.api.nvim_exec(":echo &filetype", true)

    -- paste in the banner
    vim.api.nvim_put(banner, "b", false, false)

    -- paste in comment block in front of banner
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
