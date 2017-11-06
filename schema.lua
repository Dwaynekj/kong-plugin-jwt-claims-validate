local cjson = require "cjson"
local utils = require "kong.tools.utils"

local function claim_check(value, conf)
  local valid_types = {
    ["string"]  = true,
    ["boolean"] = true,
    ["number"]  = true
  }

  for k,v in pairs(value) do
    local type = type(v)
    if not valid_types[type] or type == cjson.null then
      return false, "'claims."..k.."' is not one following types: [boolean, string, number]"
    end

    return true, nil
  end
end

local function check_user(anonymous)
  if anonymous == "" or utils.is_valid_uuid(anonymous) then
    return true
  end

  return false, "the anonymous user must be empty or a valid uuid"
end

return {
  no_consumer = true,
  fields = {
    uri_param_names = { type = "array", default = { "jwt" } },
    claims = { type = "table", func = claim_check },
    anonymous = { type = "string", default = "", func = check_user }
  }
}
