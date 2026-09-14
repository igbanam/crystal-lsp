require "json"
require "../tools"
require "../ext/enum"

module LSP
  Enum.number FileChangeType do
    Created = 1
    Changed = 2
    Deleted = 3
  end

  struct FileEvent
    include Initializer
    include JSON::Serializable

    property uri : String
    property type : FileChangeType
  end
end
