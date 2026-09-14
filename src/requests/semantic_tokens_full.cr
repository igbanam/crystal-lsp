require "json"
require "./request_message"
require "../base/semantic_tokens"

module LSP
  macro finished
    class SemanticTokensFullRequest < RequestMessage(SemanticTokens?)
      @method = "textDocument/semanticTokens/full"
      property params : SemanticTokensFullParams
    end
  end

  struct SemanticTokensFullParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
  end
end
