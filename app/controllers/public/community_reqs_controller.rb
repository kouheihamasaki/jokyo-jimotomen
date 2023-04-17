class Public::CommunityReqsController < ApplicationController
  before_action :authenticate_user!

  def new
    @community_req = CommunityReq.new
  end

  def create
    @community_req = CommunityReq.new(community_reqs_params)
    @community_req.user_id = current_user.id
    if @community_req.save
    redirect_to thanks_community_reqs_path
    else
    render :new
    end
  end

  def thanks
  end

private
 def community_reqs_params
   params.require(:community_req).permit(:title, :body, :update_status)
 end

end
