class Public::PostCommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    comment = current_user.post_comment.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
    PostComment.find(params[:id]).destroy
  end
  

private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
