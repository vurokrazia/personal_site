# frozen_string_literal: true

json.array! @articles, partial: 'api/v1/articles/article', as: :article
