# frozen_string_literal: true

# == Schema Information
#
# Table name: has_categories
#
#  id          :bigint           not null, primary key
#  entity_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  entity_id   :integer
#
# Indexes
#
#  index_has_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe HasCategory, type: :model do
  describe 'validations in has_category' do
    context 'associations' do
      it { should belong_to(:category) }
    end
  end
end
