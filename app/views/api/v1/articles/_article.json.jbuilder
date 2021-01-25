# frozen_string_literal: true

json.extract! article, :id, :title, :body, :user_id, :created_at, :updated_at, :legend
json.categories do
  json.array! article.categories.each do |category|
    json.partial! 'api/v1/categories/category', category: category
  end
end
json.article_bodies do
  json.array! article.article_bodies.each do |body|
    json.partial! 'article_body', article_body: body
  end
end
json.banner_url article.banner_url
