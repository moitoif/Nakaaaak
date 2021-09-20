class UsersController < ApplicationController
  before_action :set_current_user

  def login_form
    
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      redirect_to("/users/#{@user.id}") and return
    else
      @email = params[:email]
      render action: :login_form and return
    end
  end

  def new
    
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      flash[:notice] = "アカウント作成が完了しました。"
      redirect_to("/users/#{@user.id}")
    end
  end

  def show

    if user_signed_in? 
      # イラスト全取得
      image = Image.new
      @all_illusts = image.get_illust_all(current_user.id)
  
      # 質問受付中のイラスト取得
      @questions_illusts = image.get_illust(current_user.id, false)
  
      # 解決済みのイラスト取得
      @answers_illusts = image.get_illust(current_user.id, true)
    else
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end
end
