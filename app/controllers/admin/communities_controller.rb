class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @community = Community.page(params[:page])
  end
  
  def show
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new
    if @community.save
      redirect_to admin_community_path(@commnunity)
    else
      render :new
    end
  end
  
  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(item_params)
      redirect_to admin_community_path(@commnunity)
    else
      render :edit
    end
  end


private
 def community_params
   params.require(:community).permit(:prefecture, :title, :introduction)
 end



end
