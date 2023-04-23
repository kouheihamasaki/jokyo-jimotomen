class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def top
    @user = current_user
    @posts_new = Post.order('id DESC').limit(3)
    @posts_fav = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @posts_fav_tops =@posts_fav.first(3)
    @sample_post = Post.all.shuffle.first
    # サイドバー部分
    post_fav_bests = current_user.post.sort { |a, b| b.favorite.count <=> a.favorite.count }
    @post_fav_best = post_fav_bests.first(1)
    @user_posts = @user.post
    @favorites_count = 0
    @user_posts.each do |post|
      @favorites_count += post.favorite.count
    end
  end

  def about
  end

end
