require "json"
require "./request_message"
require "../base/reference_context"

module LSP
  macro finished
    class ReferencesRequest < RequestMessage(Array(Location)?)
      @method = "textDocument/references"
      property params : ReferenceParams
    end
  end

  struct ReferenceParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property position : Position
    property context : ReferenceContext
  end
end
