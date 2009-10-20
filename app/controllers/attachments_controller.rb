class AttachmentsController < ApplicationController
  
  before_filter :require_editor, :except => [:index,:show]
  
  def index
    @attachments = Attachment.find(:all,:order => "attachment_date DESC")
  end
  
  def show
    @attachment = Attachment.find(params[:id])
  end
  
  def new
    @attachment = Attachment.new
  end
  
  def create
    @attachment = Attachment.new(params[:attachment])
    if @attachment.save
      flash[:notice] = "Successfully created attachments."
      redirect_to @attachment
    else
      render :action => 'new'
    end
  end
  
  def edit
    @attachment = Attachment.find(params[:id])
  end
  
  def update
    @attachment = Attachment.find(params[:id])
    if @attachment.update_attributes(params[:attachment])
      flash[:notice] = "Successfully updated attachments."
      redirect_to @attachment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    flash[:notice] = "Successfully destroyed attachments."
    redirect_to attachments_url
  end
end
