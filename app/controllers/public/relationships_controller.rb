class Public::RelationshipsController < ApplicationController


  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).per(5)
    current_user.follow(params[:user_id])
  end

  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    user = current_user
    @users = user.followings
  end

  # フォロワー一覧
  def followers
    user = current_user
    @users = user.followers
  end


  private


  def user_params
    params.require(:user).permit(:last_name,:first_name,
                                     :last_name_kana,:first_name_kana,
                                     :introduction,:prefecture,:screen_name,
                                     :fav_noodle,:email,:is_deleted, :profile_image)
  end


end
