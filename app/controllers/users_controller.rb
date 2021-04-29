class UsersController < ApplicationController

  def login_form
    
  end

  def login
    
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
