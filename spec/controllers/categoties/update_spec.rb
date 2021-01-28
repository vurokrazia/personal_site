# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::CategoriesController, type: :controller do
  describe 'Edit Category' do
    let!(:bearer) { create(:token) }
    let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
    let!(:category) { create(:category) }
    context 'create a category' do
      before do
        request.headers.merge! headers
        put(:update,
            format: :json,
            params: {
              id: category.id,
              category: {
                name: 'Categoria #',
                color: '#c0c0c0c0'
              }
            })
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :name, :color) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  end
end
