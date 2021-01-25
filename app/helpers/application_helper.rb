# frozen_string_literal: true

module ApplicationHelper
  def payload_crud
    JSON.parse(response.body).with_indifferent_access
  end
end
