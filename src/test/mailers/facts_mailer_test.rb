# frozen_string_literal: true

require 'test_helper'

class FactsMailerTest < ActionMailer::TestCase
  test 'search_results' do
    mail = FactsMailer.search_results
    assert_equal 'Search results', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
