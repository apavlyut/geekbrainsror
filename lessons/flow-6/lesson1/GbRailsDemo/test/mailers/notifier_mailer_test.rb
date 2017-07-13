require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "registered" do
    mail = NotifierMailer.registered
    assert_equal "Registered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
