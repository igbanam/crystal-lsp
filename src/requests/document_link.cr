require "json"
require "./request_message"

module LSP
  macro finished
    class DocumentLinkRequest < RequestMessage(Array(DocumentLink)?)
      @method = "textDocument/documentLink"
      property params : DocumentLinkParams
    end
  end

  struct DocumentLinkParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
  end

  struct DocumentLink
    include Initializer
    include JSON::Serializable

    property range : Range
    property target : String?
    property tooltip : String?
  end
end
