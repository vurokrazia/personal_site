# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      include Secured
      before_action :authenticate_user!, except: [:create]
      before_action :set_user, only: [:destroy]
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
        @user = User.from_login(create_params)
        if @user.present?
          @token = Token.create!(user_id: @user.id)
          render :show, status: :created
        else
          render json: { error: t('credentials.user_invalid') }, status: :bad_request
        end
      end

      def me
        @user = Current.user
        if @user.present?
          render json: @user, status: :ok
        else
          head :not_found
        end
      end

      def destroy
        Current.token.destroy if Current.user.id == @user.id
      end

      private

      def create_params
        params.require(:user).permit(:email, :password)
      end

      def token_params
        params.permit(:token)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
