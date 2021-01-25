# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      include Secured
      before_action :authenticate_user!, only: [:update]
      before_action :set_user, only: [:update]
      rescue_from Exception do |e|
        render json: { error: e.message }, status: :internal_server_error
      end
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end
      def create
        @user = User.create!(user_create_params)
        if @user.present?
          @token = @user.tokens.new
          @token.save!
        end
        render :show, status: :created
      end

      def update
        @user.update(user_update_params)
        render :show, status: :ok
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_create_params
        params.require(:user).permit(:email, :password, :avatar)
      end

      def user_update_params
        params.require(:user).permit(:email, :password, :permission_level, :avatar)
      end
    end
  end
end
