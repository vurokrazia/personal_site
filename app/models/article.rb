# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  disabled   :boolean          default(FALSE), not null
#  legend     :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Article < ApplicationRecord
  belongs_to :user
  has_many :article_bodies, dependent: :destroy
  has_many :has_categories, as: :entity
  has_many :categories, through: :has_categories, dependent: :destroy
  has_one_attached :banner

  validates :title, presence: true
  validates :body, presence: true
  validates :legend, presence: true
  validates :user_id, presence: true

  accepts_nested_attributes_for :has_categories, allow_destroy: true
  accepts_nested_attributes_for :article_bodies, allow_destroy: true

  scope :order_update, -> { order(updated_at: :DESC) }
  scope :active_articles, -> { where(disabled: false) }
  include Rails.application.routes.url_helpers

  def banner_url
    if banner.attachment
      if Rails.env.development?
        "#{ENV["URL_BASE"]}#{rails_blob_path(banner, only_path: true)}"
      else
        banner.service_url
      end
    else
      nil
    end
  end
end
