# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::CategoriesController, type: :controller do
  describe 'New Category' do
    let!(:bearer) { create(:token)}
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:category) { { category: { name: 'Test A', color: '#FFF' } } }
    context 'create a category' do
      before do
        request.headers.merge! headers
        post(:create, format: :json, params: category)
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :name, :color) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
    end
  end
end
