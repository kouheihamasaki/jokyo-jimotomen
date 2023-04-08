class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @communities = Community.page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.admin_id = current_admin.id
    if @community.save
      redirect_to admin_community_path(@community)
    else
      render :new
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      redirect_to admin_community_path(@community)
    else
      render :edit
    end
  end
  
  def destroy
    @community = Community.find(params[:id])
    if @community.destroy
      redirect_to admin_communities_path
    else
      render :show
    end
  end


private
 def community_params
   params.require(:community).permit(:prefecture, :title, :introduction)
 end



end
