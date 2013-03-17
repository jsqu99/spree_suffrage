require 'spec_helper'

describe Spree::PollAnswer do
  context "#destroy" do
    it "should disallow removal if we'd go underneath the minimum answers criteria of the enclosing poll" do
      poll = Spree::Poll.create!(name: 'foo', question: 'bar')
      answer = poll.poll_answers.last
      answer.destroy
      expect {answer.reload}.to_not raise_error # record is still there b/c validation failed
    end
  end
end
