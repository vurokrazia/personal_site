# frozen_string_literal: true

json.extract! multimedium, :id, :name, :user_id, :created_at, :updated_at
json.image multimedium.image_url
