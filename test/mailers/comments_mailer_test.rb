require 'test_helper'

class CommentsMailerTest < ActionMailer::TestCase
  test 'submitted' do
    mail = CommentsMailer.submitted comments(:one)
    assert_equal 'New comment on your post!', mail.subject
    assert_equal ['blog-owner@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    # assert_match 'Hi', mail.body.encoded
  end
end
