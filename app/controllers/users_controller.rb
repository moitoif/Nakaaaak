class UsersController < ApplicationController

  def login_form
    
  end

  def login
    user = User.find_by(email: params[:email], 
                        password_digest: params[:password])
    if user
      session[:user_id] = user.id
      redirect_to("/users/#{user.id}")
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
end
