# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      include Secured
      before_action :authenticate_user!, except: %i[index]
      before_action :set_article, only: %i[show update show destroy]
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
        @articles = Article.active_articles.order_update.paginate(page: params[:page], per_page: params[:per_page])
        render :index, status: @articles.length.zero? ? :no_content : :ok
      end

      def create
        binding.pry [:banner]
        @article = Current.user.articles.create!(create_params)
        render :show, status: :created
      end

      def show
        render :show, status: :ok
      end

      def update
        @article.update!(update_params)
        render :show, status: :ok
      end

      def destroy
        if @article.disabled
          render json: {}, status: :not_found
        else
          @article.update(disabled: true)
        end
      end

      private

      def create_params
        params.require(:article).permit(:title, :body, :banner, :legend, has_categories_attributes: [:category_id], article_bodies_attributes: %i[title body])
      end

      def update_params
        params.require(:article).permit(:title, :body, :banner, :legend, has_categories_attributes: %i[id category_id _destroy], article_bodies_attributes: %i[id _destroy title body])
      end

      def set_article
        @article = Article.find(params[:id])
      end
    end
  end
end
