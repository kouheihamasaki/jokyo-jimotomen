class Admin::PostsController < ApplicationController

  def index
    @post_all = Post.all
    @posts = Post.page(params[:page]).per(10)
    @user = current_user
    
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_posts = Tag.find_by(name: key).posts
          @posts = @posts.empty? ? tag_posts : @posts & tag_posts
        end
      end
    end
    
    if params[:tag]
      Tag.create(name: params[:tag])
    end
    
  end
  
  def show
    @post = Post.find(params[:id])
    @user = current_user
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to action: :index
    else
    render :show
    end
  end
  
end
