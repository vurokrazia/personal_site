# frozen_string_literal: true

json.articles @articles, partial: 'api/v1/articles/article', as: :article
