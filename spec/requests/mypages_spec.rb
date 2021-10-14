require 'rails_helper'

RSpec.describe "MyPage", type: :request do

  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }    
  let(:image) { create(:image, user_id: user.id) }
  
  describe "マイページへのアクセス" do
    context "ログインしている場合" do
      before do
        # ログイン済みにする
        sign_in user
        get mypage_path
      end
  
      it "リクエストが成功するか" do
        expect(response.status).to eq 200
      end

    end

    context "ログインしていない場合" do
      it "ログイン画面にリダイレクトするか" do
        # ログイン失敗した場合はログイン画面に遷移する。
        get mypage_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end