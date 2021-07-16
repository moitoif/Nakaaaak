require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  it "トップページであるか" do
    get :top
    
    expect(response.status).to eq(200)
  end

end
