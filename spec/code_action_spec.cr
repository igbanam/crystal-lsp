require "./spec_helper"
require "../src/server"

describe "textDocument/codeAction request" do
  it "deserializes a codeAction request with an empty diagnostics array" do
    request = LSP::RequestMessage.from_json(%({"jsonrpc":"2.0","id":10,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"file:///a.ledger"},"range":{"start":{"line":0,"character":0},"end":{"line":0,"character":5}},"context":{"diagnostics":[]}}}))
    request.should be_a(LSP::CodeActionRequest)
    if request.is_a?(LSP::CodeActionRequest)
      request.params.context.diagnostics.should eq([] of LSP::Diagnostic)
      request.params.context.only.should be_nil
    end
  end

  it "builds a CodeAction with a WorkspaceEdit" do
    edit = LSP::WorkspaceEdit.new(changes: {
      "file:///a.ledger" => [LSP::TextEdit.new(range: LSP::Range.new(start: LSP::Position.new(line: 0, character: 0), end: LSP::Position.new(line: 0, character: 0)), new_text: "account Assets:Checking\n")],
    })
    action = LSP::CodeAction.new(title: "Add account directive for \"Assets:Checking\"", kind: LSP::CodeActionKind::QuickFix, edit: edit)
    action.title.should eq("Add account directive for \"Assets:Checking\"")
  end
end
