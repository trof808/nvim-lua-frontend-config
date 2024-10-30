local nt = require('nvim-tree')

local function new_file_location(node)
    local file_src = node['absolute_path']
    -- The args of input are {prompt}, {default}, {completion}
    -- Read in the new file path using the existing file's path as the baseline.
    local file_out = vim.fn.input("COPY TO: ", file_src, "file")
    -- Create any parent dirs as required
    local dir = vim.fn.fnamemodify(file_out, ":h")
    vim.fn.system { 'mkdir', '-p', dir }

    return file_src, file_out
end

local function copy_file_to(node)
    local file_src, file_out = new_file_location(node)
    -- Copy the file
    vim.fn.system { 'cp', file_src, file_out }
end

local function move_file_to(node)
    local file_src, file_out = new_file_location(node)
    -- Move the file
    vim.fn.system { 'mv', file_src, file_out }
end

nt.setup({
    view = {
        mappings = {
            list = {
                { key = 'c',  action = 'copy_file_to', action_cb = copy_file_to },
                { key = 'mv', action = 'move_file_to', action_cb = move_file_to }
            }
        }
    }
})
