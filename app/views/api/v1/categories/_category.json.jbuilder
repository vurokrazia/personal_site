# frozen_string_literal: true

json.extract! category, :id, :name, :color, :created_at, :updated_at
json.banner_url category.banner_url
