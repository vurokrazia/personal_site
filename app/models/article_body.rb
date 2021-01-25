# frozen_string_literal: true

# == Schema Information
#
# Table name: article_bodies
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#
# Indexes
#
#  index_article_bodies_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#
class ArticleBody < ApplicationRecord
  belongs_to :article
  validates :title, presence: true
  validates :body, presence: true
  has_one_attached :image
end
