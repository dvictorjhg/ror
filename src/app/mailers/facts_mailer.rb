# frozen_string_literal: true

class FactsMailer < ApplicationMailer
  default from: ENV['MAILER_FROM_EMAIL']

  def search_results(search)
    @search = search
    @facts = search.facts

    mail(
      to: search.email,
      subject: I18n.t('facts_mailer.search_results.subject')
    )
  end
end
