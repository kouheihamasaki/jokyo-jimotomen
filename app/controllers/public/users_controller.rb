class Public::UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  
end
