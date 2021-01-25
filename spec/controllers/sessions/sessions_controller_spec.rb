# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'POST' do
    let!(:user) { create(:user, password: '123456') }
    context 'Sessions created successfully' do
      before do
        post(:create, format: :json, params: { user: { email: user.email, password: '123456' } })
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :email, :permission_level, :created_at, :updated_at, :token, :avatar, :expires_at) }
      end
    end
  end
end
