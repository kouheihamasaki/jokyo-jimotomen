class Public::PostsController < ApplicationController

  def index
    @post = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
  end
  
  def new
    @post = Post.new
  end

  def create
    @Post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def update
  end

  def destroy
    post_image = Post.find(params[:id])
    post_image.destroy
    redirect_to pasts_path
  end
  
  
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
