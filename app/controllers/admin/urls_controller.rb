class Admin::UrlsController < Admin::BaseController
  def index
    @source = Source.find params[:source_id]
    @urls = @source.urls.page params[:page]
  end
  
  def show
    @x = Url.find params[:id]
    @share_urls = @x.share_urls.page params[:page]
  end
end