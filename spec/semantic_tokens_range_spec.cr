require "./spec_helper"
require "../src/server"

describe "textDocument/semanticTokens/range request" do
  it "deserializes a semanticTokens/range request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":11,"method":"textDocument/semanticTokens/range","params":{"textDocument":{"uri":"file:///a.ledger"},"range":{"start":{"line":0,"character":0},"end":{"line":2,"character":0}}}}))
    request.should be_a(LSP::SemanticTokensRangeRequest)
    if request.is_a?(LSP::SemanticTokensRangeRequest)
      request.params.range.start.line.should eq(0)
      request.params.range.end.line.should eq(2)
    end
  end
end
