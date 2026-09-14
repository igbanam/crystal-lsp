require "json"
require "./request_message"
require "../base/semantic_tokens"

module LSP
  macro finished
    class SemanticTokensRangeRequest < RequestMessage(SemanticTokens?)
      @method = "textDocument/semanticTokens/range"
      property params : SemanticTokensRangeParams
    end
  end

  struct SemanticTokensRangeParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property range : Range
  end
end
