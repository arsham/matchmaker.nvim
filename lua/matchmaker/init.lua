---@class HighlightOpt
---@field style string
---@field link? string if defined, everything else is ignored
---@field guifg string
---@field guibg string
---@field guisp string
---@field ctermfg string
---@field ctermbg string

---@class Quick
---@field command fun(name: string, command: string|function, opts?: table) Creates a command from provided specifics.
---@field normal fun(mode: string, motion: string, special: boolean?) Executes a command in normal mode.
---@field selection_contents fun(): string Returns the contents of the visually selected region.
---@field buffer_command fun(name: string, command: string|function, opts?: table) Creates a command from provided specifics on current buffer.
---@field call_and_centre fun(fn: fun()) Pushes the current location to the jumplist and calls the fn callback, then centres the cursor.
---@field highlight fun(group: string, opt: HighlightOpt) --Create a highlight group.

local mappings = _t({ --{{{
  { group = "MatchingAA", color = "#FF6188" },
  { group = "MatchingAB", color = "#A9DC76" },
  { group = "MatchingAC", color = "#78DCE8" },
  { group = "MatchingAD", color = "#FFD866" },
  { group = "MatchingAE", color = "#FC9867" },
  { group = "MatchingAF", color = "#AB9DF2" },
  { group = "MatchingAG", color = "darkred" },
  { group = "MatchingAH", color = "#FD6883" },
  { group = "MatchingAI", color = "#1981F0" },
  { group = "MatchingAJ", color = "#6EABEC" },
  { group = "MatchingAK", color = "#9261E2" },
  { group = "MatchingAL", color = "#E261AB" },
  { group = "MatchingAM", color = "#B7FC4F" },
  { group = "MatchingAN", color = "#4FD9FC" },
  { group = "MatchingAO", color = "#F9D9B7" },
  { group = "MatchingAP", color = "#F9B7F9" },
  { group = "MatchingAQ", color = "#006400" },
  { group = "MatchingAR", color = "#008000" },
  { group = "MatchingAS", color = "#008080" },
  { group = "MatchingAT", color = "#008B8B" },
  { group = "MatchingAU", color = "#00BFFF" },
  { group = "MatchingAV", color = "#00CED1" },
  { group = "MatchingAW", color = "#00FA9A" },
  { group = "MatchingAX", color = "#00FF00" },
  { group = "MatchingAY", color = "#00FF7F" },
  { group = "MatchingAZ", color = "#00FFFF" },
  { group = "MatchingBA", color = "#1E90FF" },
  { group = "MatchingBB", color = "#20B2AA" },
  { group = "MatchingBC", color = "#228B22" },
  { group = "MatchingBD", color = "#2E8B57" },
  { group = "MatchingBE", color = "#2F4F4F" },
  { group = "MatchingBF", color = "#32CD32" },
  { group = "MatchingBG", color = "#3CB371" },
  { group = "MatchingBH", color = "#40E0D0" },
  { group = "MatchingBI", color = "#4169E1" },
  { group = "MatchingBJ", color = "#4682B4" },
  { group = "MatchingBK", color = "#483D8B" },
  { group = "MatchingBL", color = "#48D1CC" },
  { group = "MatchingBM", color = "#4B0082" },
  { group = "MatchingBN", color = "#556B2F" },
  { group = "MatchingBO", color = "#5F9EA0" },
  { group = "MatchingBP", color = "#6495ED" },
  { group = "MatchingBQ", color = "#66CDAA" },
  { group = "MatchingBR", color = "#696969" },
  { group = "MatchingBS", color = "#6A5ACD" },
  { group = "MatchingBT", color = "#6B8E23" },
  { group = "MatchingBU", color = "#708090" },
  { group = "MatchingBV", color = "#778899" },
  { group = "MatchingBW", color = "#7B68EE" },
  { group = "MatchingBX", color = "#87CEFA" },
  { group = "MatchingBY", color = "#87CEEB" },
  { group = "MatchingBZ", color = "#00BFFF" },
  { group = "MatchingCA", color = "#2F4F4F" },
  { group = "MatchingCB", color = "#48D1CC" },
  { group = "MatchingCC", color = "#20B2AA" },
  { group = "MatchingCD", color = "#5F9EA0" },
  { group = "MatchingCE", color = "#008B8B" },
  { group = "MatchingCF", color = "#008080" },
  { group = "MatchingCG", color = "#7FFFD4" },
  { group = "MatchingCH", color = "#90EE90" },
  { group = "MatchingCI", color = "#98FB98" },
  { group = "MatchingCJ", color = "#8FBC8F" },
  { group = "MatchingCK", color = "#7CFC00" },
  { group = "MatchingCL", color = "#7FFF00" },
  { group = "MatchingCM", color = "#ADFF2F" },
  { group = "MatchingCN", color = "#00FF7F" },
  { group = "MatchingCO", color = "#00FA9A" },
  { group = "MatchingCP", color = "#32CD32" },
  { group = "MatchingCQ", color = "#9ACD32" },
  { group = "MatchingCR", color = "#808000" },
  { group = "MatchingCS", color = "#556B2F" },
  { group = "MatchingCT", color = "#7FFF00" },
  { group = "MatchingCU", color = "#ADFF2F" },
  { group = "MatchingCV", color = "#00FF7F" },
  { group = "MatchingCW", color = "#00FA9A" },
  { group = "MatchingCX", color = "#32CD32" },
  { group = "MatchingCY", color = "#9ACD32" },
  { group = "MatchingCZ", color = "#808000" },
  { group = "MatchingDA", color = "#556B2F" },
  { group = "MatchingDB", color = "#7FFF00" },
  { group = "MatchingDC", color = "#ADFF2F" },
  { group = "MatchingDD", color = "#00FF7F" },
  { group = "MatchingDE", color = "#00FA9A" },
  { group = "MatchingDF", color = "#32CD32" },
  { group = "MatchingDG", color = "#9ACD32" },
  { group = "MatchingDH", color = "#808000" },
  { group = "MatchingDI", color = "#556B2F" },
  { group = "MatchingDJ", color = "#7FFF00" },
}):shuffle() --}}}

---@type Quick
local quick = require("arshlib.quick")

for _, mapping in pairs(mappings) do --{{{
  vim.api.nvim_set_hl(0, mapping["group"], {
    fg = "#232627",
    bg = mapping["color"],
    bold = true,
  })
end --}}}

local last_group = 0
local function next_group() --{{{
  last_group = last_group + 1
  if last_group > #mappings then
    last_group = 1
  end
  return mappings[last_group]["group"]
end --}}}

-- selene: allow(global_usage)
function _G.add_match_partial() --{{{
  local term = vim.fn.expand("<cword>")
  vim.fn.matchadd(next_group(), term)
end --}}}

function _G.add_match_exact() --{{{
  local term = vim.fn.expand("<cword>")
  term = "\\<" .. term .. "\\>"
  vim.fn.matchadd(next_group(), term)
end --}}}

local function add_match_visual() --{{{
  local term = quick.selection_contents()
  term = term:gsub("\n", "\\_.")
  vim.fn.matchadd(next_group(), term)
end --}}}

function _G.add_match_line() --{{{
  local term = "\\%" .. vim.fn.line(".") .. "l"
  vim.fn.matchadd(next_group(), term)
end --}}}

-- stylua: ignore start
local defaults = { --{{{
  add     = "<leader>ma",
  exact   = "<leader>me",
  pattern = "<leader>mp",
  line    = "<leader>ml",
  clear   = "<leader>mc",
  delete  = "<leader>md",
} --}}}

return {
  config = function(opts)
    opts = vim.tbl_extend("force", defaults, opts)
    local strings = { "string", "nil", "boolean" }
    vim.validate({ --{{{
      opts    = { opts,         "table" },
      add     = { opts.add,     strings },
      exact   = { opts.exact,   strings },
      pattern = { opts.pattern, strings },
      line    = { opts.line,    strings },
      clear   = { opts.clear,   strings },
      delete  = { opts.delete,  strings },
    }) --}}}

    if opts.add then --{{{
      local desc = "Add any matches containing a word under the cursor"
      vim.keymap.set("n", opts.add, function()
        vim.opt.opfunc = "v:lua.add_match_partial"
        return "g@<cr>"
      end, { expr = true, desc = desc })
    end --}}}

    if opts.exact then --{{{
      local desc = "Add any exact matches containing a word under the cursor"
      vim.keymap.set("n", opts.exact, function()
        vim.opt.opfunc = "v:lua.add_match_exact"
        return "g@<cr>"
      end, { expr = true, desc = desc })
      vim.keymap.set("x", opts.exact, add_match_visual, {  desc = desc })
    end --}}}

    if opts.pattern then --{{{
      vim.keymap.set("n", opts.pattern, function()
        vim.ui.input({
          prompt = "Pattern: ",
        }, function(term)
            if term then
              vim.fn.matchadd(next_group(), term)
            end
           end
        )
      end, { desc = "Add any matches containing the input from user" })
    end --}}}

    if opts.line then --{{{
      local desc = "Add current line"
      vim.keymap.set("n", opts.line, function()
        vim.opt.opfunc = "v:lua.add_match_line"
        return "g@<cr>"
      end, { expr = true, desc = desc })
    end --}}}

    if opts.clear then --{{{
      vim.keymap.set("n", opts.clear, function()
        local groups = _t()
        mappings:map(function(v)
          groups[v.group] = true
        end)

        _t(vim.fn.getmatches())
          :filter(function(v)
            return v and groups[v.group]
          end)
          :map(function(v)
            vim.fn.matchdelete(v.id)
          end)
      end, { desc = "Clear all matches of the current buffer" })
    end --}}}

    if opts.delete then --{{{
      vim.keymap.set("n", opts.delete, function()
        local source = _t()
        local groups = _t()
        mappings:map(function(v)
          groups[v.group] = v.color
        end)

        _t(vim.fn.getmatches())
          :filter(function(v)
            return v and groups[v.group]
          end)
          :sort(function(a, b)
            return a.id > b.id
          end)
          :map(function(v)
            local str = string.format("%2d\t%50s\t%20s", v.id, v.pattern, groups[v.group])
            table.insert(source, str)
          end)

        if #source == 0 then
          return
        end

        local wrap = vim.fn["fzf#wrap"]({
          source = source,
          options = table.concat({
            "--multi",
            "--bind",
            "ctrl-a:select-all+accept ",
            "--layout reverse-list",
            '--delimiter="\t"',
            "--with-nth=2..",
          }, " "),
        })
        wrap["sink*"] = function(list)
          for _, name in pairs(list) do
            local id = string.match(name, "^%s*(%d+)")
            if id ~= nil then
              vim.fn.matchdelete(id)
            end
          end
        end
        vim.fn["fzf#run"](wrap)
      end, { desc = "List all matches and remove by user's selection" })
    end --}}}
  end,
}
-- stylua: ignore end

-- vim: fdm=marker fdl=0
