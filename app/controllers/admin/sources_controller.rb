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
  
  def update
    @source = Source.find params[:id]
    if @source.update_attributes(params[:source])
      redirect_to(admin_sources_path, :notice => "更新成功")
    else
      redirect_to :action => "edit", :error => @source.errors.full_messages
    end
  end

  def edit
    @source = Source.find params[:id]
  end
  
  def destroy
    @source = Source.find params[:id]
    @source.delete
    redirect_to(admin_sources_path, :notice => "删除成功!")
  end
  
  def statistics
    @source = Source.find params[:id]
    
  end
end