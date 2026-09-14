require "./spec_helper"
require "../src/server"

describe "textDocument/rename request" do
  it "deserializes a rename request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":5,"method":"textDocument/rename","params":{"textDocument":{"uri":"file:///a.ledger"},"position":{"line":2,"character":4},"newName":"Assets:Checking"}}))
    request.should be_a(LSP::RenameRequest)
    if request.is_a?(LSP::RenameRequest)
      request.params.text_document.uri.should eq("file:///a.ledger")
      request.params.position.line.should eq(2)
      request.params.new_name.should eq("Assets:Checking")
    end
  end
end
