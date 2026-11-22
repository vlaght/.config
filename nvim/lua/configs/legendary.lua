-- Feed every described keymap into legendary once, so the palette
-- also lists NvChad/user mappings (legendary only knows what it's given).
local M = {}
local loaded = false

local function load_keymaps()
    if loaded then
        return
    end
    loaded = true
    local items = {}
    for _, mode in ipairs { "n", "v", "i" } do
        for _, km in ipairs(vim.api.nvim_get_keymap(mode)) do
            local rhs = km.callback or km.rhs
            if
                km.desc
                and rhs
                and not km.lhs:match "^<Plug>"
                and not km.lhs:match "^<SNR>"
            then
                table.insert(items, {
                    km.lhs,
                    rhs,
                    mode = { mode },
                    description = km.desc,
                    opts = { noremap = km.noremap == 1, silent = km.silent == 1 },
                })
            end
        end
    end
    require("legendary").keymaps(items)
end

function M.find()
    load_keymaps()
    require("legendary").find()
end

return M
