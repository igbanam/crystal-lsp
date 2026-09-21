require "./spec_helper"
require "../src/server"

describe "textDocument/inlayHint request" do
  it "deserializes an inlayHint request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":10,"method":"textDocument/inlayHint","params":{"textDocument":{"uri":"file:///a.ledger"},"range":{"start":{"line":0,"character":0},"end":{"line":10,"character":0}}}}))
    request.should be_a(LSP::InlayHintRequest)
    if request.is_a?(LSP::InlayHintRequest)
      request.params.text_document.uri.should eq("file:///a.ledger")
      request.params.range.start.line.should eq(0)
      request.params.range.end.line.should eq(10)
    end
  end

  it "builds and serializes an InlayHint with a position and label" do
    hint = LSP::InlayHint.new(
      position: LSP::Position.new(line: 3, character: 20),
      label: "Assets:Checking 1,450 USD",
    )
    hint.position.line.should eq(3)
    hint.label.should eq("Assets:Checking 1,450 USD")
    hint.to_json.should contain(%("label":"Assets:Checking 1,450 USD"))
  end
end
