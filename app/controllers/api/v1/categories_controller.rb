# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      include Secured
      before_action :authenticate_user!, except: %i[index articles]
      before_action :set_category, only: %i[show update destroy]
      rescue_from Exception do |e|
        render json: { error: e.message }, status: :internal_server_error
      end
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end
      def index
        @categories = Category.paginate(page: params[:page], per_page: params[:per_page])
        render :index, status: @categories.length.zero? ? :no_content : :ok
      end

      def create
        @category = Category.create!(create_params)
        render :show, status: :created
      end

      def articles
        @articles = Category.find(params[:category_id]).articles.active_articles.order_update.paginate(page: params[:page], per_page: params[:per_page])
        render 'api/v1/articles/index', status: @articles.length.zero? ? :no_content : :ok
      end

      def show; end

      def update
        @category.update!(create_params)
        render :show, status: :ok
      end

      private

      def create_params
        params.require(:category).permit(:name, :color, :banner)
      end

      def set_category
        @category = Category.find(params[:id])
      rescue StandardError
        head :not_found
      end
    end
  end
end
