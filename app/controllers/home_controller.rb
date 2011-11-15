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
      @url = @source.urls.find_by_origin(referer_url)
      if @url.nil?
        doc = Nokogiri::HTML.parse(open(referer_url), nil, "UTF-8")  
        title = URI.escape doc.at_css("title").text
        @url = @source.urls.create(:origin => referer_url, :title => title)
      end
      @share_url = @url.share_urls.create(:user_id => @user.id, :s_type => params[:type])
    end
    redirect_to @url.get_redirect_link(@source.title, referer_url, @source.image_url, @source.summary, params[:type])
  end
  
  def mail_form
    @url = params[:url]
    @subject = params[:title]
    @content = @url + "\n" + @subject
  end
  
  def send_mail
    @to = params[:to]
    Pony.mail(:to => params[:to], :from => params[:from], :subject => params[:subject], :body => params[:content], :via => :sendmail)
  end
end