require "json"
require "../tools"

module LSP
  struct ReferenceContext
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "includeDeclaration")]
    property include_declaration : Bool
  end
end
