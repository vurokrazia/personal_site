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
FactoryBot.define do
  factory :has_category do
    article
    category
  end
end
