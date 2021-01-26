# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  locale                 :string(255)      default("es"), not null
#  permission_level       :integer          default(0), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations in User' do
    it 'validate presence of required fields' do
      should validate_presence_of(:email)
      should validate_presence_of(:password)
    end
    context 'associations' do
      it { should have_many(:tokens) }
      it { should have_many(:articles) }
    end
  end
end
