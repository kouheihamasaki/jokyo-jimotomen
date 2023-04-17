class Admin::CommunityCommentsController < ApplicationController

  def destroy
    CommunityComment.find(params[:id]).destroy
    redirect_to admin_community_path(params[:community_id])
  end


end
