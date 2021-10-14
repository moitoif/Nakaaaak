require 'rails_helper'

RSpec.describe "Auth", type: :request do

  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe "POST /auth" do
    it 'リクエストが成功すること' do
      post user_registration_path, params: { user: user_params }
      expect(response.status).to eq 302
    end

    it 'createが成功すること' do
      expect do
        post user_registration_path, params: { user: user_params }
      end.to change(User, :count).by 1
    end
  end
end
