class Admin::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "投稿記事"
      @posts = Post.looks(params[:word])
      @result_word = params[:word]
      render "admin/searches/search_result"
    else
      @communities = Community.looks(params[:word])
      @result_word = params[:word]
      render "admin/searches/search_result"
    end

  end

end
