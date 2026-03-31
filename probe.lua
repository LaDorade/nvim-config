local function update_marks_float(buf)
    -- Récupérer les marques (locales a-z et globales A-Z)
    local marks = {}
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    for i = 1, #chars do
        local char = chars:sub(i, i)
        local mark = vim.api.nvim_get_mark(char, {})
        if mark[1] > 0 then
            -- On récupère un extrait de la ligne pour le contexte
            table.insert(marks, string.format(" %s : L%d  %s", char, mark[1], mark[4]))
        end
    end

    if #marks == 0 then marks = { " (Aucune marque)" } end

    -- Mettre à jour le buffer de la floating window
    vim.api.nvim_buf_set_option(buf, 'modifiable', true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, marks)
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function create_marks_window()
    local buf = vim.api.nvim_create_buf(false, true)

    -- Calcul de la position (Haut à droite)
    local width = 30
    local height = 8
    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        col = vim.o.columns - width - 2,
        row = 1,
        style = 'minimal',
        border = 'rounded',
        focusable = false, -- On ne peut pas cliquer dedans
    }

    local win = vim.api.nvim_open_win(buf, false, opts)
    vim.api.nvim_win_set_option(win, 'winblend', 15)

    -- Mise à jour initiale
    update_marks_float(buf)

    -- Auto-rafraîchissement quand on change de buffer ou qu'on s'arrête de taper
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
        callback = function()
            if vim.api.nvim_win_is_valid(win) then
                update_marks_float(buf)
            end
        end,
    })
end

-- Lancer la fenêtre au démarrage
create_marks_window()
