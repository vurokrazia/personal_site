# frozen_string_literal: true

# == Schema Information
#
# Table name: multimedia
#
#  id           :bigint           not null, primary key
#  content_type :integer
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_multimedia_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Multimedium < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  before_validation :assign_name
  validates :name, presence: true, allow_blank: false
  # validate :acceptable_type_image, if: -> { image.attached? } #, on: :create
  def image_url
    if image.attachment
      if Rails.env.development?
        "#{ENV['url']}#{Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)}"
      else
        image.service_url
      end
    else
      # set a default lazily
      ActionController::Base.helpers.asset_path('default_icon.png')
    end
  end

  private

  def acceptable_image
    errors.add(:image, 'is too big') unless image.byte_size <= 1.megabyte
  end

  def acceptable_type_image
    acceptable_types = ['image/jpeg', 'image/png']
    if acceptable_types.include?(image.content_type)
      self.content_type = 0
    else
      errors.add(:image, 'must be a JPEG or PNG')
    end
  end

  def assign_name
    self.name = image.filename if image.present?
  end
end
