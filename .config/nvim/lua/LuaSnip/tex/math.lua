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

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  s({ trig = "ff", snippetType = "autosnippet", condition = in_mathzone }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  s({ trig = "not", snippetType = "autosnippet", condition = in_mathzone }, t("\\lnot ")),
  s({ trig = "and", snippetType = "autosnippet", condition = in_mathzone }, t("\\land ")),
  s({ trig = "or", snippetType = "autosnippet", condition = in_mathzone }, t("\\lor ")),
  s({ trig = "->", snippetType = "autosnippet", condition = in_mathzone }, t("\\to ")),
}
