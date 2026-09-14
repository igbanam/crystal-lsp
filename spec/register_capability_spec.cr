require "./spec_helper"
require "../src/server"

describe "client/registerCapability request" do
  it "serializes a registration for workspace/didChangeWatchedFiles" do
    request = LSP::RegisterCapabilityRequest.new(
      id: "1",
      params: LSP::RegistrationParams.new(registrations: [
        LSP::Registration.new(
          id: "reckless-watch-ledgers",
          method: "workspace/didChangeWatchedFiles",
          register_options: nil,
        ),
      ]),
    )
    json = request.to_json
    json.should contain(%("method":"client/registerCapability"))
    json.should contain(%("method":"workspace/didChangeWatchedFiles"))
  end
end
