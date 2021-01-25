# frozen_string_literal: true

class CreateMultimedia < ActiveRecord::Migration[6.0]
  def change
    create_table :multimedia do |t|
      t.integer :content_type
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
