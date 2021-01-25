# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe 'Edit Article' do
    let!(:bearer) { create(:token)}
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:article) { create(:article, user: bearer.user) }
    let!(:article_bodies) { create(:article_body, article: article) }
    context 'create a article' do
      before do
        request.headers.merge! headers
        put(:update,
            format: :json,
            params: {
              id: article.id,
              article: {
                title: 'Titulo GG',
                body: 'Body GG',
                article_bodies_attributes: [
                  { id: article_bodies.id, title: 'Test BBBB', body: 'Lorem' }
                ]
              }
            })
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :title, :body) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  end
end
