# frozen_string_literal: true

class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :fact_id
      t.text :categories
      t.text :value
      t.string :url
      t.string :icon_url
      t.references :search, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
