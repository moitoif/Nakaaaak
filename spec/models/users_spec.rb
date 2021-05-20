require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "メールアドレス、パスワードが存在するとき有効であるか" do
    user = User.new(
      email: "test@test.com",
      password: "testtest"
    )
    expect(user).to be_valid
  end

  it "ユーザー名、メールアドレス、パスワードが存在するとき有効であるか" do
    user = User.new(
      email: "test@test.com",
      password: "testtest",
      username: "テストユーザー"
    )
  end

end
