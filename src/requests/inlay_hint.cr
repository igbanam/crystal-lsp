require "json"
require "./request_message"

module LSP
  macro finished
    class InlayHintRequest < RequestMessage(Array(InlayHint)?)
      @method = "textDocument/inlayHint"
      property params : InlayHintParams
    end
  end

  struct InlayHintParams
    include WorkDoneProgressParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property range : Range
  end

  struct InlayHint
    include Initializer
    include JSON::Serializable

    property position : Position
    property label : String
  end
end
