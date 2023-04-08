class Admin::CommunityReqsController < ApplicationController
  
  def index
    @community_requests = Community_request.all
    @communities = Community.page(params[:page]).per(10)
  end
  
  def show
    
  end

  def edit
    
  end

  def update
    
  end
  
end
