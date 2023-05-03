class Admin::HomesController < ApplicationController

  def top
    # 新着順に投稿を３つ持ってくる（新着記事）
    @posts_new = Post.order('id DESC').limit(3)
    # 投稿を「いいね」が高い順に並べる
    @posts_fav = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @posts_fav_tops =@posts_fav.first(3)
    # 投稿をランダムで１つもってくる
    @sample_post = Post.all.shuffle.first
  end

end
