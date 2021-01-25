# frozen_string_literal: true

module Api
  module V1
    class MultimediumController < ApplicationController
      include Secured
      before_action :authenticate_user!
      before_action :set_multimedium, only: %i[destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end
      def index
        @multimedia = Multimedium.paginate(page: params[:page], per_page: params[:per_page])
        render :index, status: :ok
      end

      def create
        @multimedium = Current.user.multimedia.create!(create_params)
        render :show, status: :created
      end

      def destroy
        @multimedium.destroy
      end

      private

      def create_params
        params.permit(:image)
      end

      def set_multimedium
        @multimedium = Multimedium.find(params[:id])
      end
    end
  end
end
