# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  locale                 :string(255)      default("es"), not null
#  locked_at              :datetime
#  permission_level       :integer          default(0), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unlock_token           :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  include PermissionsConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tokens, dependent: :delete_all
  has_many :articles
  has_many :multimedia
  has_one_attached :avatar
  # validates :avatar, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def self.from_login(user_params)
    user = User.find_by(email: user_params[:email].downcase)
    user if user&.valid_password?(user_params[:password])
  end

  def avatar_url
    url = ""
    if avatar.attachment
      if Rails.env.development?
        url = Rails.application.routes.url_helpers.rails_blob_url(avatar, only_path: true)
      else
        avatar.service_url
      end
    else
      # set a default lazily
      url = ActionController::Base.helpers.asset_path("default_icon.png")
    end
    "#{ENV["URL_BASE"]}#{url}"
  end
end
