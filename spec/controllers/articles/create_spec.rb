# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe 'POST' do
    let!(:bearer) { create(:token) }
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:category) { create(:category) }
    let!(:article) { { article: { title: 'Test A', body: 'Lorem', has_categories_attributes: [{ category_id: category.id }], article_bodies_attributes: [{ title: 'Test B', body: 'Lorem' }, { title: 'Test C', body: 'Lorem' }, { title: 'Test D', body: 'Lorem' }] } } }
    context 'create a article' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: article)
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :title, :body, :user_id, :created_at, :updated_at) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
    end
  end
end
