require "json"
require "./request_message"

module LSP
  macro finished
    # Reckless-fork addition (Phase 4b), mirroring the Phase 2 pattern used for
    # `$/reckless/status`: a new request type plus a `json_discriminator` entry.
    # See the Reckless Phase 4 design doc for the client-side plan built on this.
    class WorkspaceSymbolRequest < RequestMessage(Array(SymbolInformation)?)
      @method = "workspace/symbol"
      property params : WorkspaceSymbolParams
    end
  end

  struct WorkspaceSymbolParams
    include Initializer
    include JSON::Serializable

    property query : String
  end
end
