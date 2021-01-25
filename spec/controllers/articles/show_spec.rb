# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe 'POST' do
    let!(:bearer) { create(:token)}
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:article) { create(:article, user: bearer.user) }
    context 'show a article' do
      before do
        request.headers.merge! headers
        get(:show, format: :json, params: { id: article.id })
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
