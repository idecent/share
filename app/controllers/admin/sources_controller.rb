# encoding: utf-8
class Admin::SourcesController < Admin::BaseController
  def index
    @sources = Source.order("created_at desc").page params[:page]
  end
  
  def new
    @source = Source.new
  end
  
  def show
    @source = Source.find params[:id]
  end
  
  def create
    @source = Source.new(params[:source])
    if @source.save
      redirect_to(admin_sources_path, :notice => "创建成功")
    else
      redirect_to :action => "new", :error => @source.errors.full_messages
    end
  end

  def edit
  end
  
  def destroy
  end
end