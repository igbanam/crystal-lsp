require "json"
require "./request_message"

module LSP
  macro finished
    class RenameRequest < RequestMessage(WorkspaceEdit?)
      @method = "textDocument/rename"
      property params : RenameParams
    end
  end

  struct RenameParams
    include WorkDoneProgressParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property position : Position
    @[JSON::Field(key: "newName")]
    property new_name : String
  end
end
