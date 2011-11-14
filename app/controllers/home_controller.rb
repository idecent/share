class HomeController < ApplicationController
  def index
  end
  
  def share
    if Rails.env == 'production'
      @host = "http://share.lijiping.com/share_to"
    else
      @host = "http://localhost:3000/share_to"
    end
    @source = Source.find_by_title params[:source]
    @user = @source.users.find_or_create_by_uid params[:uid]
    Rails.logger.debug "---------------"
    Rails.logger.debug @user.inspect
    respond_to do |format|
      format.js
    end
  end
  
  def share_to
    referer_url = request.headers['referer']
    if params[:source] && params[:uid]
      @source = Source.find_by_title(params[:source])
      @user = @source.users.find_or_create_by_uid params[:uid]
      @url = @source.urls.create(:origin => referer_url, :s_type => params[:type], :user_id => @user.id)
    end
    
    redirect_to @url.get_redirect_link(@source.title, referer_url, @source.image_url, @source.summary, params[:type])
  end
end