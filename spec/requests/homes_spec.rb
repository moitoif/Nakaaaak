require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe "GET /homes" do

    before do
      get "/"
    end

    it "アクセス確認" do
      expect(response).to have_http_status(200)
    end

    it "ページ文言表示確認" do
      expect(response.body).to match("最新の質問")
    end
  end
end
