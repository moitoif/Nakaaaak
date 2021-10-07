require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントが500文字入力されているとき有効であるか" do
    comment = Comment.new
    comment.comment = "a" * 500
    comment.valid?
    expect(comment).to be_valid
  end

  it "コメントが500文字を超過しているとき" do
    comment = Comment.new
    comment.comment = "a" * 501
    comment.valid?
    expect(comment.errors.full_messages_for(:comment)).to include("コメントは500文字以内で入力してください")
  end
end