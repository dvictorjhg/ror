# frozen_string_literal: true

class ChuckNorrisApi
  BASE_URL = 'https://api.chucknorris.io/jokes'

  def self.categories
    response = HTTParty.get("#{BASE_URL}/categories")
    return [] unless response.success?

    response
  end

  def self.random
    response = HTTParty.get("#{BASE_URL}/random")
    return nil unless response.success?

    response
  end

  def self.search_by_text(query)
    response = HTTParty.get("#{BASE_URL}/search?query=#{URI.encode_www_form_component(query)}")
    return { 'result' => [] } unless response.success?

    response
  end

  def self.random_by_category(category)
    response = HTTParty.get("#{BASE_URL}/random?category=#{URI.encode_www_form_component(category)}")
    return nil unless response.success?

    response
  end
end
