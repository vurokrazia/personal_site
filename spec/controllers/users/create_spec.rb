# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST' do
    let!(:user) { { user: { email: 'jesus@gmail.com', password: '123456' } } }
    context 'create a user' do
      before do
        post(:create, format: :json, params: user)
      end
      context 'payload' do
        subject { payload_crud }
        it { is_expected.to include(:id, :email, :permission_level) }
      end
      context 'response' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
    end
  end
end
