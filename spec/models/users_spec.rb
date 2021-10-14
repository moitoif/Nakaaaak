require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  
  it "ユーザー名、メールアドレス、パスワードが存在するとき有効であるか" do
    user = User.new(
      email: "test@test.com",
      password: "testtest",
      username: "テストユーザー"
    )
    expect(user).to be_valid
  end

  it "メールアドレス、パスワードが存在するときエラーとなるか" do
    user = User.new(
      email: "test@test.com",
      password: "testtest"
    )
    user.valid?
    expect(user.errors.full_messages_for(:username)).to include ("ユーザー名を入力してください")
  end
  
end
