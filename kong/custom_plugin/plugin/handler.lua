local utils = require("kong.plugins.oidc.utils")
local filter = require("kong.plugins.oidc.filter")
local session = require("kong.plugins.oidc.session")

local CustomHandler = {
  VERSION  = "1.0.0",
  PRIORITY = 899,
}

function CustomHandler:init_worker()
  -- Implement logic for the init_worker phase here (http/stream)
  kong.log(">>> init_worker <<<")
end


function CustomHandler:preread(config)
  -- Implement logic for the preread phase here (stream)
  kong.log(">>> preread <<<")
end


function CustomHandler:certificate(config)
  -- Implement logic for the certificate phase here (http/stream)
  kong.log(">>> certificate <<<")
end

function CustomHandler:rewrite(config)
  -- Implement logic for the rewrite phase here (http)
  kong.log(">>> rewrite <<<")
end

function CustomHandler:access(config)
  -- Implement logic for the access phase here (http)
  kong.log(">>> access <<<")
end

function CustomHandler:ws_handshake(config)
  -- Implement logic for the WebSocket handshake here
  kong.log(">>> ws_handshake <<<")
end

function CustomHandler:header_filter(config)
  -- Implement logic for the header_filter phase here (http)
  kong.log(">>> header_filter <<<")
end

function CustomHandler:ws_client_frame(config)
  -- Implement logic for WebSocket client messages here
  kong.log(">>> ws_client_frame <<<")
end

function CustomHandler:ws_upstream_frame(config)
  -- Implement logic for WebSocket upstream messages here
  kong.log(">>> ws_upstream_frame <<<")
end

function CustomHandler:body_filter(config)
  -- Implement logic for the body_filter phase here (http)
  kong.log(">>> body_filter <<<")
end

function CustomHandler:log(config)
  -- Implement logic for the log phase here (http/stream)
  kong.log(">>> log <<<")
end

function CustomHandler:ws_close(config)
  -- Implement logic for WebSocket post-connection here
  kong.log(">>> ws_close <<<")
end

-- return the created table, so that Kong can execute it
return CustomHandler
