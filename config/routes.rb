Rails.application.routes.draw do
  # トップ
  get "/" => "home#top"

  # ユーザ
  # 新規登録
  get "signup" => "users#new"
  post "users/create" => "users#create"


  get "login" => "users#login_form"
  post "login" => "users#login"
  # 画像アップロード
  get "images" => "images#index"

end
