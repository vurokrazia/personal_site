# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  color      :string(255)
#  disabled   :boolean          default(FALSE), not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations in category' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:color)
    end
  end
end
