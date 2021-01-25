# frozen_string_literal: true

class AddColumnLegendToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :legend, :string
  end
end
