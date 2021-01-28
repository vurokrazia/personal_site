# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  color      :string(255)
#  disabled   :boolean          default(FALSE), not null
#  name       :string(255)
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  has_many :has_categories, dependent: :destroy
  has_many :articles, through: :has_categories, source: :entity, source_type: "Article"
  has_one_attached :banner

  def banner_url
    ConcernImage.path_image banner
  end
end
