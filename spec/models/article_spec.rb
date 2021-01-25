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
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations in article' do
    it 'validate presence of required fields' do
      should validate_presence_of(:title)
      should validate_presence_of(:body)
      should validate_presence_of(:user_id)
    end
    context 'associations' do
      it { should belong_to(:user) }
    end
  end
end
