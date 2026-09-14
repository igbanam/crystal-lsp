require "./spec_helper"
require "../src/server"

describe "textDocument/foldingRange request" do
  it "deserializes a foldingRange request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":8,"method":"textDocument/foldingRange","params":{"textDocument":{"uri":"file:///a.ledger"}}}))
    request.should be_a(LSP::FoldingRangeRequest)
  end

  it "serializes a FoldingRange with an optional kind" do
    range = LSP::FoldingRange.new(start_line: 3, end_line: 7, kind: "comment")
    range.to_json.should contain(%("startLine":3,"endLine":7,"kind":"comment"))
  end

  it "serializes a FoldingRange with kind omitted as nil" do
    range = LSP::FoldingRange.new(start_line: 1, end_line: 4, kind: nil)
    range.kind.should be_nil
  end
end
