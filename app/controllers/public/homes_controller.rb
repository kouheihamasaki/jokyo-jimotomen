class Public::HomesController < ApplicationController
  before_action :authenticate_user!, except: [:about]

  def top
    @user = current_user
  end

  def about
  end

end
