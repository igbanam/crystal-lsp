require "./spec_helper"
require "../src/server"

describe "workspace/symbol request" do
  it "deserializes a workspace/symbol request with a query" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":3,"method":"workspace/symbol","params":{"query":"Foo"}}))
    request.should be_a(LSP::WorkspaceSymbolRequest)
    request.method.should eq("workspace/symbol")
    if request.is_a?(LSP::WorkspaceSymbolRequest)
      request.params.query.should eq("Foo")
    end
  end

  it "deserializes a workspace/symbol request with an empty query" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":4,"method":"workspace/symbol","params":{"query":""}}))
    request.should be_a(LSP::WorkspaceSymbolRequest)
    if request.is_a?(LSP::WorkspaceSymbolRequest)
      request.params.query.should eq("")
    end
  end
end
