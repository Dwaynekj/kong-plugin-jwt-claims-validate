-- Reference https://github.com/Kong/kong-plugin/blob/master/kong-plugin-myplugin-0.1.0-1.rockspec
package = "kong-plugin-jwt-claims-validate"
version = "0.1.0-1"
supported_platforms = {"linux", "macosx"}
source = {
   url = "git+https://github.com/Dwaynekj/kong-plugin-jwt-claims-validate.git",
   tag = "v0.1.0"
}

local pluginName = package:match("^kong%-plugin%-(.+)$")  -- "jwt-claims-validate"

description = {
   summary = "A Kong plugin to check JWT claim values",
   homepage = "https://github.com/Dwaynkekj/kong-plugin-jwt-claims-validate",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.jwt-claims-validate.handler"] = "handler.lua",
      ["kong.plugins.jwt-claims-validate.schema"] = "schema.lua"
   }
}
