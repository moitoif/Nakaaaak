FactoryBot.define do
  factory :image do
    name { "test"}
    content { "テスト用コンテンツ" }
    filename { "テストファイル.jpg" }
    answer_flg { false }
    comment_flg { false }
  end
end