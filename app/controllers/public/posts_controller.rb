class Public::PostsController < ApplicationController

  def index
    @post_all = Post.all
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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_tag_id = 
    if @post.save!
    redirect_to posts_path
    else
    render :new
    end
  end
  
  def update
  end

  def destroy
    post_image = Post.find(params[:id])
    post_image.destroy
    redirect_to pasts_path
  end
  
  
  
  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :title, :body, :post_tag)
  end
  
end
