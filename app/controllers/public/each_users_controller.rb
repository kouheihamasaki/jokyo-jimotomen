class Public::EachUsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).per(5)
  end



end
