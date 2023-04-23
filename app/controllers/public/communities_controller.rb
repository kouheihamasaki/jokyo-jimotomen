class Public::CommunitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @community_all = Community.all
    @communities = Community.page(params[:page]).per(10)

    # サイドバー部分
    post_fav_bests = current_user.post.sort { |a, b| b.favorite.count <=> a.favorite.count }
    @post_fav_best = post_fav_bests.first(1)
    @user_posts = @user.post
    @favorites_count = 0
    @user_posts.each do |post|
      @favorites_count += post.favorite.count
    end
  end

  def show
    @user = current_user
    @community = Community.find(params[:id])
    @community_comment = CommunityComment.new

    # サイドバー部分
    post_fav_bests = current_user.post.sort { |a, b| b.favorite.count <=> a.favorite.count }
    @post_fav_best = post_fav_bests.first(1)
    @user_posts = @user.post
    @favorites_count = 0
    @user_posts.each do |post|
      @favorites_count += post.favorite.count
    end
  end


end
