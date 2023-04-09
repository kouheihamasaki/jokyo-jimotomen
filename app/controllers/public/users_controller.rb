class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]


  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to my_page_users
  end

  def unsubscribe
  end

  def withdraw
  end
  
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to about_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
