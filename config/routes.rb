Rails.application.routes.draw do
  # トップ
  get "/" => "home#top"
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # ログイン
  get "login" => "users#login_form"
  post "login" => "users#login"

  get "mypage" => "users#show"

  # イラスト投稿
  get "upload" => "illusts#upload_form"
  post "upload" => "illusts#upload"
  get "illust/edit/:id" => "illusts#edit"
  post "illust/update/:id" => "illusts#update"

  # ユーザ
  # 新規登録
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"

  # 画像アップロード
  get "images" => "images#index"

  # 質問ページ
  get "questions/:id" => "questions#index"
  post "questions/upload/:id" => "questions#upload"

end
