class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def guest_check
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :screen_name, :email, :introduction, :prefecture, :fav_noodle])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end



end
