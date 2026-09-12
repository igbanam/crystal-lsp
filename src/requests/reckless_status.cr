require "json"
require "./request_message"

module LSP
  macro finished
    # Reckless-specific extension method. Exposes evaluator/config status to a
    # client that asks -- this is a *pull*, never a pushed `window/*` popup;
    # see CLAUDE.md's "fully invisible" evaluator design note.
    class RecklessStatusRequest < RequestMessage(RecklessStatusResult)
      @method = "$/reckless/status"
      property params : RecklessStatusParams?
    end
  end

  struct RecklessStatusParams
    include Initializer
    include JSON::Serializable
  end

  struct RecklessStatusResult
    include Initializer
    include JSON::Serializable

    @[JSON::Field(key: "evaluatorAvailable")]
    property evaluator_available : Bool

    @[JSON::Field(key: "binaryPath")]
    property binary_path : String?

    property flavor : String
  end
end
