# frozen_string_literal: true

class Fact < ActiveRecord::Base
  belongs_to :search

  def categories_array
    return [] if categories.blank?

    begin
      JSON.parse(categories)
    rescue StandardError
      []
    end
  end

  def categories_list
    categories_array.join(', ')
  end
end
