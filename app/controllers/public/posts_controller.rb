class Public::PostsController < ApplicationController

  def index
    @post_all = Post.all
    
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
  end

  def edit
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
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
    params.require(:post).permit(:shop_name, :image, :title, :body, tag_ids: [])
  end
  
end
