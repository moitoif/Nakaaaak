require 'rails_helper'

RSpec.describe Image, type: :model do
  it "全文入力確認" do
    image = Image.new
    image.name = "テストタイトル"
    image.content = "テスト説明文"
    image.filename = "test"
    expect(image).to be_valid
  end

  it "タイトル未入力" do
    image = Image.new
    image.name = ""
    image.valid?
    
    expect(image.errors.full_messages_for(:name)).to include("タイトルを入力してください")
  end

  it "説明文未入力" do
    image = Image.new
    image.content = ""
    image.valid?
    
    expect(image.errors.full_messages_for(:content)).to include("説明文を入力してください")
  end

  it "ファイル存在なし" do
    image = Image.new
    image.filename = ""
    image.valid?
    
    expect(image.errors.full_messages_for(:filename)).to include("イラストを選択してください")
  end

  it "すべて未入力、ファイル存在なし" do
    image = Image.new
    image.valid?
    
    expect(image.errors.full_messages_for(:name)).to include("タイトルを入力してください")
    expect(image.errors.full_messages_for(:content)).to include("説明文を入力してください")
    expect(image.errors.full_messages_for(:filename)).to include("イラストを選択してください")
  end

  it "文字数確認" do
    image = Image.new
    image.name = "a" * 40
    image.content = "a" * 400
    image.filename = "test"
    image.valid?

    expect(image).to be_valid
  end

  it "文字数超過確認" do
    image = Image.new
    image.name = "a" * 41
    image.content = "a" * 401
    image.filename = "test"
    image.valid?

    expect(image.errors.full_messages_for(:name)).to include("タイトルは40文字以内で入力してください")
    expect(image.errors.full_messages_for(:content)).to include("説明文は400文字以内で入力してください")
  end

end
