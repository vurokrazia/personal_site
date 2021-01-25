# frozen_string_literal: true

class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :description
      t.string :link
      t.datetime :published_at
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
