class Admin::HomesController < ApplicationController

 def top
  @posts_new = Post.order('id DESC').limit(3)
  @posts_fav = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  @posts_fav_tops =@posts_fav.first(3)
  @sample_post = Post.all.shuffle.first
 end

end
