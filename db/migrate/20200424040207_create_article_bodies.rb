# frozen_string_literal: true

class CreateArticleBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :article_bodies do |t|
      t.string :title
      t.text :body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
