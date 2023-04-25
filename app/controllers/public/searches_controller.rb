class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @user = current_user
    # サイドバー部分
    post_fav_bests = current_user.post.sort { |a, b| b.favorite.count <=> a.favorite.count }
    @post_fav_best = post_fav_bests.first(1)
    @user_posts = @user.post
    @favorites_count = 0
    @user_posts.each do |post|
      @favorites_count += post.favorite.count
    end

    if @range == "投稿記事"
      @posts = Post.looks(params[:word])
      @result_word = params[:word]
      render "public/searches/search_result"
    else
      @communities = Community.looks(params[:word])
      @result_word = params[:word]
      render "public/searches/search_result"
    end

  end

end
