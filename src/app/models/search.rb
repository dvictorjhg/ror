# frozen_string_literal: true

class Search < ActiveRecord::Base
  has_many :facts, dependent: :destroy

  validates :search_type, presence: true

  SEARCH_TYPES = %w[text category random].freeze

  def execute_search
    case search_type
    when 'text'
      search_by_text
    when 'category'
      search_by_category
    when 'random'
      search_random
    end
  end

  private

  def search_by_text
    response = ChuckNorrisApi.search_by_text(query)
    save_facts(response['result']) if response && response['result']
  end

  def search_by_category
    response = ChuckNorrisApi.random_by_category(query)
    save_facts([response]) if response
  end

  def search_random
    response = ChuckNorrisApi.random
    save_facts([response]) if response
  end

  def save_facts(facts_data)
    facts_data.each do |fact_data|
      facts.create(
        fact_id: fact_data['id'],
        categories: fact_data['categories'].to_json,
        value: fact_data['value'],
        url: fact_data['url'],
        icon_url: fact_data['icon_url']
      )
    end
  end
end
