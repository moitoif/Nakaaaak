class UsersController < ApplicationController
  before_action :set_current_user

  def login_form
    
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      redirect_to("/users/#{@user.id}") and return
    else
      logger.debug("else句に突入")
      @error_message = "メールアドレスまたはパスワードが異なります。"
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
    @user = User.find_by(id: params[:id])
    # @current_user = current_user.id
    # イラスト全取得
    image = Image.new
    @illusts = image.get_illust_all(current_user.id)
  end
end
