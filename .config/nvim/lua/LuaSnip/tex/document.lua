local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s(
    { trig = "make_document" },
    fmta(
      [[
  \documentclass{<>}
  \usepackage[margin=1in]{geometry}
  \usepackage{graphicx, float}
  \usepackage[shortlabels]{enumitem}
  \usepackage{amsmath, amsthm, amssymb}

  \title{<>}
  \author{Sudhir Krisna Kesavamoorthy Nanthakumar<>}
  \date{<> 2026}

  \begin{document}

  \maketitle

  <>

  \end{document}
  ]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),

  s({ trig = "assign" }, fmta("<> Assignment \\#<>", { i(1), i(0) })),
}
