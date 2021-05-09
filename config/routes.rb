Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # トップ
  get "/" => "home#top"
  
  # ログイン
  get "login" => "users#login_form"
  post "login" => "users#login"



  # ユーザ
  # 新規登録
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"

  # 画像アップロード
  get "images" => "images#index"

end
