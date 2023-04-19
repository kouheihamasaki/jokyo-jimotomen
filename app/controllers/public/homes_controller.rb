class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def top
    @user = current_user
    @posts_new = Post.order('id DESC').limit(3)
    @posts_fav = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @posts_fav_tops =@posts_fav.first(3)
    @user_post_tops = User.where(id: Post.group(:user_id).order('count(user_id) desc').pluck(:user_id))
    @user_ranks = @user_post_tops.first(3)
  end

  def about
  end

end
