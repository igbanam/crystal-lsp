require "json"
require "../tools"
require "./work_done_progress"

module LSP
  struct SemanticTokensLegend
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "tokenTypes")]
    property token_types : Array(String)
    @[JSON::Field(key: "tokenModifiers")]
    property token_modifiers : Array(String)
  end

  struct SemanticTokens
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "resultId")]
    property result_id : String?
    property data : Array(UInt32)
  end

  struct SemanticTokensOptions
    include Initializer
    include JSON::Serializable
    include WorkDoneProgressOptions

    property legend : SemanticTokensLegend
    property full : Bool?
    property range : Bool?
  end
end
