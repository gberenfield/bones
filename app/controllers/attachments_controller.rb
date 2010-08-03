class AttachmentsController < ApplicationController
  before_filter :authenticate_user!
  
  def get_atr_value(elem, atr, couples)
    if atr.instance_of?(String) && atr.include?('.')
      value = get_nested_atr_value(elem, atr.split('.').reverse) 
    else
      value = couples[atr]
      value = elem.send(atr.to_sym) if value.blank? && elem.respond_to?(atr) # Required for virtual attributes
    end
    value
  end
  
  def jqgrid_jason(orders) # CAN PROBABLY DO AWAY WITH THIS METHOD AFTER NEXT >jqGrid 3.6.2 update I HOPE!!!!
    # wrap below in a helper and chunck into bones!     #######################################
    attributes=[:id,:attachment_file_name,:description,:comments]
    
    current_page=params[:page] || 1
    per_page=params[:rows]
    total=orders.total_entries

    json = %Q({"page":"#{current_page}","total":#{total/per_page.to_i+1},"records":"#{total}")
    if total > 0 then
      json << %Q(,"rows":[)
      orders.each do |elem|
        elem.id ||= index(elem)
        json << %Q({"id":"#{elem.id}","cell":[)
        couples = elem.attributes.symbolize_keys
        attributes.each_with_index do |atr,i|
          value = get_atr_value(elem, atr, couples)
          json << %Q("#{value}",)
        end
        json.chop! << "]},"
      end
      json.chop! << "]}"
    else
      json << "}"
    end
    
    return json
  end
  
  def grid
    
    printing=false
    filter=""
    oparams=params.dup
    oparams.delete(:action)
    oparams.delete(:controller)
    oparams.delete(:id)
    oparams.delete(:nd)
    oparams.delete(:sord)
    oparams.delete(:sidx)
    oparams.delete(:page)
    oparams.delete(:rows)
    oparams.delete(:_search)
    
    myfilter=""    
    if oparams.size>0 then          # jqGrid filterToolbar() search/filter
      session[:filterbar]=true
      oparams.each do |p|          
        filter+=" AND (#{p[0]} LIKE '#{p[1]}%')"
      end
      myfilter+= filter  
      session[:lastfilters]=filter
      session[:filtering]=true
    else      
      session[:filterbar]=false
      session[:filteringnow]=false
    end
    attachments = Attachment.paginate :page => params[:page],:per_page => params[:rows],:conditions =>myfilter,:order=>"#{params[:sidx]} #{params[:sord]}"
    jason=jqgrid_jason(attachments)
    
    respond_to do |format|
      format.json {render :json => jason}
      format.js {if !printing then render :json => jason end }
    end
    
  end
  
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
  
  def updategrid
    params.delete(:action)
    params.delete(:controller)
    params.delete(:oper)
    @attachment = Attachment.find(params[:rid])

    params.delete(:id)
    params.delete(:rid)
    
    if @attachment.update_attributes(params) then
      render :layout=>false
    end
    
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
