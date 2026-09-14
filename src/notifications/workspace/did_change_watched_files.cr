require "json"
require "../notification_message"
require "../../base/file_event"

module LSP
  class DidChangeWatchedFilesNotification < NotificationMessage
    @method = "workspace/didChangeWatchedFiles"
    property params : DidChangeWatchedFilesParams
  end

  struct DidChangeWatchedFilesParams
    include Initializer
    include JSON::Serializable

    property changes : Array(FileEvent)
  end
end
