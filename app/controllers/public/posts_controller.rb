class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check, except: [:index, :show]

  def index
    @post_all = Post.all
    @posts = Post.page(params[:page]).per(10)
    @user = current_user
    @tag_pre = Tag.where(tag_kind: 0)
    @tag_genre = Tag.where(tag_kind: 1)
    @tag_others = Tag.where(tag_kind: 2)

    # タグ検索機能
    if params[:tag_ids]
      @posts = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          tag_posts = Tag.find_by(name: key).posts
          @posts = @posts.empty? ? tag_posts : @posts & tag_posts
          @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
        end
      end
    end

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
    @post = Post.find(params[:id])
    @user = current_user
    @post_comment = PostComment.new

    # サイドバー部分
    post_fav_bests = current_user.post.sort { |a, b| b.favorite.count <=> a.favorite.count }
    @post_fav_best = post_fav_bests.first(1)
    @user_posts = @user.post
    @favorites_count = 0
    @user_posts.each do |post|
      @favorites_count += post.favorite.count
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tag_pre = Tag.where(tag_kind: 0)
    @tag_genre = Tag.where(tag_kind: 1)
    @tag_others = Tag.where(tag_kind: 2)
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new
    @tags =Tag.all
    @tag_pre = Tag.where(tag_kind: 0)
    @tag_genre = Tag.where(tag_kind: 1)
    @tag_others = Tag.where(tag_kind: 2)
  end

  def create
    @post = Post.new(post_params)
    @tags =Tag.all
    @tag_pre = Tag.where(tag_kind: 0)
    @tag_genre = Tag.where(tag_kind: 1)
    @tag_others = Tag.where(tag_kind: 2)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が成功しました"
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to posts_path
    else
      render :index
    end
  end



  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :title, :body, :star, :adress, :latitude, :longitude, tag_ids: [])
  end

  def tag_params
    params.require(:tag).permit(:name, :tag_kind)
  end

end
