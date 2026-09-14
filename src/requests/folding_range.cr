require "json"
require "./request_message"

module LSP
  macro finished
    class FoldingRangeRequest < RequestMessage(Array(FoldingRange)?)
      @method = "textDocument/foldingRange"
      property params : FoldingRangeParams
    end
  end

  struct FoldingRangeParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
  end

  struct FoldingRange
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "startLine")]
    property start_line : Int32
    @[JSON::Field(key: "endLine")]
    property end_line : Int32
    property kind : String?
  end
end
