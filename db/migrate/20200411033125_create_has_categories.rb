# frozen_string_literal: true

class CreateHasCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :has_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
