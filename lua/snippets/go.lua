local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
  s('iferr', {
    t 'if err != nil {',
    t { '', '\t' },
    i(1, 'return err'),
    t { '', '}' },
    i(0),
  }),
}
