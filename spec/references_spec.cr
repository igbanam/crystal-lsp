require "./spec_helper"
require "../src/server"

describe "textDocument/references request" do
  it "deserializes a references request with includeDeclaration" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":6,"method":"textDocument/references","params":{"textDocument":{"uri":"file:///a.ledger"},"position":{"line":2,"character":4},"context":{"includeDeclaration":true}}}))
    request.should be_a(LSP::ReferencesRequest)
    if request.is_a?(LSP::ReferencesRequest)
      request.params.context.include_declaration.should be_true
    end
  end
end
