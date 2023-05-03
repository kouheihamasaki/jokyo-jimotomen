class Users::SessionsController < ApplicationController
  
  # ゲストログイン機能
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'guestuserでログインしました。'
  end
  
end
