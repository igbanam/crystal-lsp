require "json"
require "./request_message"

module LSP
  macro finished
    class RegisterCapabilityRequest < RequestMessage(Nil)
      @method = "client/registerCapability"
      property params : RegistrationParams
    end
  end

  struct RegistrationParams
    include Initializer
    include JSON::Serializable

    property registrations : Array(Registration)
  end

  struct Registration
    include Initializer
    include JSON::Serializable

    property id : String
    property method : String
    @[JSON::Field(key: "registerOptions")]
    property register_options : JSON::Any?
  end
end
