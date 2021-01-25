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
class HasCategory < ApplicationRecord
  belongs_to :category
  belongs_to :entity, polymorphic: true
end
