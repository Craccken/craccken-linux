local luasnip = require("luasnip")
local snippet = luasnip.snippet
local snippet_node = luasnip.snippet_node
local indent_snippet_node = luasnip.indent_snippet_node
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node
local choice_node = luasnip.choice_node
local dynamic_node = luasnip.dynamic_node
local restore_node = luasnip.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local lambda = extras.lambda
local rep = extras.rep
local partial = extras.partial
local match = extras.match
local noempty = extras.nonempty
local dynamic_lambda = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

luasnip.add_snippets("bash", {
    snippet("init-zsh", text_node({"#!/usr/bin/env zsh", "emulate -L zsh; setopt extendedglob warncreateglobal pipefail nounset errreturn"})),
})
