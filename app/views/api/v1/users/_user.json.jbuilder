# frozen_string_literal: true

json.extract! user, :id, :email, :permission_level, :created_at, :updated_at
json.avatar user.avatar_url
json.partial! 'api/v1/tokens/token', token: @token if @token.present?
