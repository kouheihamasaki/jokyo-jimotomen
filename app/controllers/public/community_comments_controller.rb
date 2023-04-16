class Public::CommunityCommentsController < ApplicationController

  def create
    community = Community.find(params[:community_id])
    comment = current_user.community_comment.new(community_comment_params)
    comment.community_id = community.id
    comment.save
    redirect_to community_path(community)
  end

  def destroy
    CommunityComment.find(params[:id]).destroy
    redirect_to community_path(params[:community_id])
  end


private

  def community_comment_params
    params.require(:community_comment).permit(:comment)
  end

end
