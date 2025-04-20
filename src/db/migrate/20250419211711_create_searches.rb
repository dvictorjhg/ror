# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :query
      t.string :search_type
      t.string :email

      t.timestamps null: false
    end
  end
end
