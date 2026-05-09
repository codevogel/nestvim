local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- expget snippet
  s(
    "expget",
    fmt(
      [[
@export var _{}: {}

var {}: {}:
	get:
		return _{}
]],
      {
        i(1, "name"), -- private var name
        i(2, "Type"), -- type
        f(function(args)
          return args[1][1]
        end, { 1 }), -- public name
        f(function(args)
          return args[1][1]
        end, { 2 }), -- public type
        f(function(args)
          return args[1][1]
        end, { 1 }), -- return private var
      }
    )
  ),

  -- export snippet
  s(
    "export",
    fmt(
      [[
@export var _{}: {}
]],
      {
        i(1, "name"), -- private var name
        i(2, "Type"), -- type
      }
    )
  ),

  -- get snippet
  s(
    "get",
    fmt(
      [[
var {}: {}:
	get:
		return _{}
]],
      {
        i(1, "name"), -- public name
        i(2, "Type"), -- type
        f(function(args)
          return args[1][1]
        end, { 1 }), -- return private var
      }
    )
  ),

  -- validation snippet
  -- validation snippet
  s(
    "getvalidation",
    fmt(
      [[
func _get_validation_conditions() -> Array[ValidationCondition]:
	var conditions: Array[ValidationCondition] = [
		ValidationCondition.{}({})
	]
	return conditions
]],
      {
        i(1, "type"), -- placeholder for type
        i(2, "condition"), -- placeholder for condition
      }
    )
  ),
}
