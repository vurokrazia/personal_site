# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:user) { create(:user, email: 'jesus@gmail.com', password: '123456') }
  let!(:bearer) { create(:token, user: user) }
  let!(:headers) { { 'Authorization' => "Bearer #{bearer.token}" } }
  describe 'UPDATE' do
    context 'update a user' do
      before do
        request.headers.merge! headers
        put(:update,
            format: :json,
            params: {
              id: user.id,
              user: { email: 'jesus.a@gmail.com',
                      password: user.password,
                      permission_level: user.permission_level }
            })
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :email, :permission_level) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:ok) }
      end
    end
  end
end
