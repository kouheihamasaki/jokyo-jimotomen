class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  
  def create
     @tag = Tag.create!(name: params[:tag], tag_kind: params[:tag_kind])

  end

end