require "json"
require "../../tools"
require "../notification_message"

module LSP
  # Sent by the client when a configuration setting relevant to the server
  # has changed on the client side. `settings` is server-defined; Reckless
  # treats it as the same camelCase shape used by `initializationOptions`.
  class DidChangeConfigurationNotification < NotificationMessage
    @method = "workspace/didChangeConfiguration"
    property params : DidChangeConfigurationParams
  end

  struct DidChangeConfigurationParams
    include Initializer
    include JSON::Serializable

    property settings : JSON::Any?
  end
end
