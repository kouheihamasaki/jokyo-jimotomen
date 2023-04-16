class Public::CommunitiesController < ApplicationController

  def index
    @user = current_user
    @community_all = Community.all
    @communitis = Post.page(params[:page]).per(10)
  end

  def show
    @user = current_user
    @community = Community.find(params[:id])
  end


end
