require "./spec_helper"
require "../src/server"

describe "textDocument/semanticTokens/full request" do
  it "deserializes a semanticTokens/full request" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":7,"method":"textDocument/semanticTokens/full","params":{"textDocument":{"uri":"file:///a.ledger"}}}))
    request.should be_a(LSP::SemanticTokensFullRequest)
    if request.is_a?(LSP::SemanticTokensFullRequest)
      request.params.text_document.uri.should eq("file:///a.ledger")
    end
  end

  it "serializes a SemanticTokens result with a legend-free flat data array" do
    tokens = LSP::SemanticTokens.new(result_id: nil, data: [0_u32, 0_u32, 4_u32, 1_u32, 0_u32])
    tokens.to_json.should contain(%("data":[0,0,4,1,0]))
  end

  it "builds a SemanticTokensOptions with a legend" do
    legend = LSP::SemanticTokensLegend.new(token_types: ["keyword", "account"], token_modifiers: ["declaration"])
    options = LSP::SemanticTokensOptions.new(legend: legend, full: true, range: false)
    options.legend.token_types.should eq(["keyword", "account"])
  end
end
