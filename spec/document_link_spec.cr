require "./spec_helper"
require "../src/server"

describe "textDocument/documentLink request" do
  it "deserializes a documentLink request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":9,"method":"textDocument/documentLink","params":{"textDocument":{"uri":"file:///a.ledger"}}}))
    request.should be_a(LSP::DocumentLinkRequest)
  end

  it "serializes a DocumentLink with a target and tooltip" do
    link = LSP::DocumentLink.new(
      range: LSP::Range.new(start: LSP::Position.new(line: 0, character: 8), end: LSP::Position.new(line: 0, character: 20)),
      target: "file:///2024/main.ledger",
      tooltip: "2024/main.ledger"
    )
    link.to_json.should contain(%("target":"file:///2024/main.ledger"))
  end

  it "uses the existing DocumentLinkOptions for capability advertisement" do
    options = LSP::DocumentLinkOptions.new(resolve_provider: false)
    options.resolve_provider.should be_false
  end
end
