local colors = {
  bg       = "#16171D",
  fg       = "#f8f8f0",
  line_bg  = "#1F2328",
  selection = "#3E4451",
  comment  = "#5c6370",
  red      = "#FF3F4F",
  orange   = "#FF9700",
  yellow   = "#FFD945",
  green    = "#81F900",
  cyan     = "#19D1E5",
  blue     = "#00a0e4",
  purple   = "#E373CE",
  grey     = "#495162",
  white    = "#F6F6F6",
}

local hl = vim.api.nvim_set_hl

-- UI
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "CursorLine", { bg = colors.line_bg })
hl(0, "Visual", { bg = colors.selection })
hl(0, "LineNr", { fg = colors.grey })
hl(0, "CursorLineNr", { fg = colors.white, bold = true })
hl(0, "Search", { fg = colors.bg, bg = colors.yellow })

-- Syntaxe
hl(0, "Comment", { fg = colors.comment, italic = true })
hl(0, "String", { fg = colors.yellow })
hl(0, "Number", { fg = colors.purple })
hl(0, "Boolean", { fg = colors.purple })
hl(0, "Float", { fg = colors.purple })
hl(0, "Constant", { fg = colors.purple })

hl(0, "Identifier", { fg = colors.blue })
hl(0, "Function", { fg = colors.green })
hl(0, "Statement", { fg = colors.red })
hl(0, "Conditional", { fg = colors.red })
hl(0, "Repeat", { fg = colors.red })
hl(0, "Operator", { fg = colors.red })
hl(0, "Keyword", { fg = colors.red })
hl(0, "PreProc", { fg = colors.red })

hl(0, "Type", { fg = colors.cyan, italic = true })
hl(0, "StorageClass", { fg = colors.red, italic = true })
hl(0, "Structure", { fg = colors.cyan })
hl(0, "Special", { fg = colors.purple })

hl(0, "@variable", { fg = colors.blue })
hl(0, "@parameter", { fg = colors.orange, italic = true })
hl(0, "@property", { fg = colors.fg })
hl(0, "@constructor", { fg = colors.cyan })
hl(0, "@tag", { fg = colors.red })
hl(0, "@tag.attribute", { fg = colors.green })
hl(0, "@punctuation.bracket", { fg = colors.white })
