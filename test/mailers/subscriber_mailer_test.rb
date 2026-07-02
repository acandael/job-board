require "test_helper"

class SubscriberMailerTest < ActionMailer::TestCase
  test "weekly_summary" do
    subscriber = subscribers(:one)
    mail = SubscriberMailer.with(subscriber: subscriber).weekly_summary
    assert_equal "New jobs this week", mail.subject
    assert_equal [ subscriber.email ], mail.to
    assert_equal [ "from@example.com" ], mail.from
  end
end
