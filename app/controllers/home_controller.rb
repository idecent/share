class HomeController < ApplicationController
  def index
  end
  
  def share
    respond_to do |format|
      format.js
    end
  end
end