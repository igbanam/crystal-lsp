require "./spec_helper"
require "../src/server"

describe "workspace/didChangeWatchedFiles notification" do
  it "deserializes a change event" do
    notification = LSP::NotificationMessage.from_json(%({"jsonrpc":"2.0","method":"workspace/didChangeWatchedFiles","params":{"changes":[{"uri":"file:///a.ledger","type":2}]}}))
    notification.should be_a(LSP::DidChangeWatchedFilesNotification)
    if notification.is_a?(LSP::DidChangeWatchedFilesNotification)
      notification.params.changes.size.should eq(1)
      notification.params.changes.first.uri.should eq("file:///a.ledger")
      notification.params.changes.first.type.should eq(LSP::FileChangeType::Changed)
    end
  end

  it "deserializes each FileChangeType value" do
    LSP::FileEvent.from_json(%({"uri":"file:///a.ledger","type":1})).type.should eq(LSP::FileChangeType::Created)
    LSP::FileEvent.from_json(%({"uri":"file:///a.ledger","type":3})).type.should eq(LSP::FileChangeType::Deleted)
  end
end
