package = "custom_plugin"
version = "1.0.0-0"

source = {
    url = "git://github.com/something/something"
}

description = {
  summary = "",
  license = "Apache 2.0",
}

dependencies = {
  "lua ~> 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.custom_plugin.handler"] = "plugin/handler.lua",
    ["kong.plugins.custom_plugin.schema"] = "plugin/schema.lua",
  }
}
