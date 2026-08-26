local ls = require 'luasnip'

-- local t = ls.text_node
--
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local t = ls.text_node
local extras = require 'luasnip.extras'
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep
-- NOTE: Lua Snippets
ls.add_snippets('lua', {
  s(
    'objectNew',
    fmt(
      [[
          {} = {{}}

          function {}:new({})
            local newObj = {{}}
            self.__index = self
            return setmetatable(newObj, self)
          end
            ]],
      {
        i(1, 'Obj_name'),
        rep(1),
        i(2, 'args'),
      }
    )
  ),
})

-- NOTE: Go Snippets
ls.add_snippets('go', {
  s(
    'ifi',
    fmt(
      [[
      if _, {} := {}; {} != nil {{
        return {}, {}
      }}
        ]],
      {
        i(1, 'err'),
        i(2),
        rep(1),
        i(3),
        rep(1),
      }
    )
  ),
  s(
    'ctx',
    fmt('{} context.Context', {
      i(1, 'ctx'),
    })
  ),
  s(
    'ifem',
    fmt(
      [[
if err := {}; err != nil {{
  return {}
}}
]],
      {
        i(1, 'doThing()'),
        c(2, {
          t 'err',
          sn(
            nil,
            fmt('fmt.Errorf("{}: %w", err)', {
              i(1, 'doThing'),
            })
          ),
        }),
      }
    )
  ),
})
