# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe 'Index' do
    let!(:bearer) { create(:token) }
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:articles) { create_list(:article, 10) }

    describe 'Index Articles' do
      before do
        request.headers.merge! headers
        get(:index, format: :json)
      end
      context 'payload' do
        subject { payload_crud[:articles].size }
        it { is_expected.to eq(articles.size) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  end
end
