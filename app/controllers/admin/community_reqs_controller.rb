class Admin::CommunityReqsController < ApplicationController

  def index
    @community_reqs = CommunityReq.page(params[:page]).per(10)
  end

  def show
    @community_req = CommunityReq.find(params[:id])
  end

  def edit
    @community_req = CommunityReq.find(params[:id])
  end

  def update
    @community_req = CommunityReq.find(params[:id])
    if @community_req.update(community_reqs_params)
      redirect_to admin_community_reqs_path, notice: "正常に更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @community_req = CommunityReq.find(params[:id])
    if @community_req.destroy
      redirect_to admin_community_reqs_path, notice: "削除しました。"
    else
      render :edit
    end
  end


  private

  def community_reqs_params
    params.require(:community_req).permit(:title, :body, :update_status)
  end


end
