Rails.application.routes.draw do

  # ログイン
  get "login" => "users#login_form"
  post "login" => "users#login"


  # トップ
  get "/" => "home#top"

  # ユーザ
  # 新規登録
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"

  # 画像アップロード
  get "images" => "images#index"

end
