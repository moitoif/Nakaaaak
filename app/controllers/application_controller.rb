class ApplicationController < ActionController::Base
  before_action :set_current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def after_sign_in_path_for(resource)
    # pages_show_path
    mypage_path
  end

  protected 
  def configure_permitted_parameters
    # ユーザー名を登録・編集可能とする。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
