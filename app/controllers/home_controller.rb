class HomeController < ApplicationController
  def index
  end
  
  def share
    if params[:user_id] && params[:support]
    else
    end
    respond_to do |format|
      format.js
    end
  end
end