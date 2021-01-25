# frozen_string_literal: true

# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  disabled   :boolean          default(FALSE), not null
#  expires_at :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'validations in Token' do
    it 'validate presence of required fields' do
      should validate_presence_of(:user_id)
      should validate_presence_of(:token)
      should validate_presence_of(:expires_at)
    end
  end
end
