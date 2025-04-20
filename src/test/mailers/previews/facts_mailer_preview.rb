# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/facts_mailer
class FactsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/facts_mailer/search_results
  def search_results
    FactsMailer.search_results
  end
end
