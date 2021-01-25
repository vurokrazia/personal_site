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
class Token < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :token, presence: true
  validates :expires_at, presence: true
  after_initialize :generate_auth_token
  def is_valid?
    DateTime.now < expires_at
  end

  private

  def generate_auth_token
    loop do
      self.token = SecureRandom.hex
      break unless Token.where(token: token).any?
    end
    self.expires_at ||= 1.month.from_now
  end
end
