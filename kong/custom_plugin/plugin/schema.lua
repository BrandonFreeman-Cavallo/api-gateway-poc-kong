local typedefs = require "kong.db.schema.typedefs"

return {
  name = "custom_plugin",
  fields = {
    {
      config = {
        type = "record",
        fields = {
          { org_id = { type = "string" }, },
          { route = { type = "string" } },
        }
      },
    },
  },
}
