# frozen_string_literal: true

module PermissionsConcern
  extend ActiveSupport::Concern
  def is_normal_user?
    permission_level.zero?
  end

  def is_editor?
    permission_level >= 1
  end

  def is_admin?
    permission_level >= 2
  end
end
