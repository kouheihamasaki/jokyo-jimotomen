class Public::PostsController < ApplicationController

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
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to posts_path
    else
    render :index
    end
  end
  
  
  
  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :title, :body, :star, tag_ids: [])
  end
  
end
