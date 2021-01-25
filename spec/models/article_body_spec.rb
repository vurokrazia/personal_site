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
require 'rails_helper'

RSpec.describe ArticleBody, type: :model do
  describe 'validations in ArticleBody' do
    it 'validate presence of required fields' do
      should validate_presence_of(:title)
      should validate_presence_of(:body)
    end
    context 'associations' do
      it { should belong_to(:article) }
    end
  end
end
