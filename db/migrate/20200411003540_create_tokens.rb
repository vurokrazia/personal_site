# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :expires_at
      t.boolean :disabled, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
