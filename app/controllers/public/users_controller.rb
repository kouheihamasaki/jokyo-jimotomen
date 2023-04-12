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
    @user = current_user
    if @user.update!(user_params)
      redirect_to my_page_users_path, notice: "正常に更新されました。"
    else
      render "edit"
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    if @user.update(is_deleted:true)
    sign_out_and_redirect(current_user)
    else
     render "unsubscribe"
    end
  end
  
  
  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to about_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end


  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,
                                     :last_name_kana,:first_name_kana,
                                     :introduction,:prefecture,:screen_name,
                                     :fav_noodle,:email,:is_deleted)
  end
  
end
