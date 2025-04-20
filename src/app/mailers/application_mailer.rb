# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM_EMAIL']
  layout 'mailer'
end
