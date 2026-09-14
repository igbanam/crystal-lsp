require "json"
require "./request_message"

module LSP
  macro finished
    class CodeActionRequest < RequestMessage(Array(CodeAction)?)
      @method = "textDocument/codeAction"
      property params : CodeActionParams
    end
  end

  struct CodeActionParams
    include WorkDoneProgressParams
    include PartialResultParams
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property range : Range
    property context : CodeActionContext
  end

  struct CodeActionContext
    include Initializer
    include JSON::Serializable

    property diagnostics : Array(Diagnostic)
    property only : Array(CodeActionKind)?
  end

  struct CodeAction
    include Initializer
    include JSON::Serializable

    property title : String
    property kind : CodeActionKind?
    property edit : WorkspaceEdit?
  end
end
