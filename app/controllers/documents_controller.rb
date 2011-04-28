class DocumentsController < ApplicationController
  before_filter :authenticate_user!

  JS_ESCAPE_MAP = {
    '\\'    => '\\\\',
    '</'    => '<\/',
    "\r\n"  => '\n',
    "\n"    => '\n',
    "\r"    => '\n',
    '"'     => '\\"'
  }
  # ,
  # "'"     => "\\'" }

  def escape_javascript(javascript)
    if javascript
      javascript.gsub(/(\\|<\/|\r\n|[\n\r"'])/) { JS_ESCAPE_MAP[$1] }
    else
      ''
    end
  end

  def get_atr_value(elem, atr, couples)
    if atr.instance_of?(String) && atr.include?('.')
      value = get_nested_atr_value(elem, atr.split('.').reverse) 
    else
      value = couples[atr]
      value = elem.send(atr.to_sym) if value.blank? && elem.respond_to?(atr) # Required for virtual attributes
    end
    if value.nil? then return nil 
    elsif (value.class==String) then 
      return escape_javascript(value)
    else
      return value
    end 
  end



  def jqgrid_jason(orders) # CAN PROBABLY DO AWAY WITH THIS METHOD AFTER NEXT >jqGrid 3.6.2 update I HOPE!!!!
    # wrap below in a helper and chunck into bones!     #######################################
    attributes=[:id,:document_url_thumb,:document_file_name,:description,:comments]

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
              if i==1 then
                value = "<img src='#{elem.document.url(:thumb)}' >"
              else
                value = get_atr_value(elem, atr, couples)
              end
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
        [:action,:controller,:id,:nd,:sord,:sidx,:page,:rows,:_search].each do |p|
          oparams.delete(p)
        end

        if oparams.size>0 then          # jqGrid filterToolbar() search/filter
          session[:filterbar]=true
          oparams.each do |p|          
            filter += (filter=="" ? "(#{p[0]} = '#{p[1]}')" : " AND (#{p[0]} = '#{p[1]}')")
          end
          session[:lastfilters]=filter
          session[:filtering]=true
        else      
          session[:filterbar]=false
          session[:filteringnow]=false
        end
        documents = Document.paginate :page => params[:page],:per_page => params[:rows],:conditions =>filter,:order=>"#{params[:sidx]} #{params[:sord]}"
        jason=jqgrid_jason(documents)

        respond_to do |format|
          format.json {render :json => jason}
          format.js {if !printing then render :json => jason end }
        end

      end

      def index
        @documents = Document.find(:all,:order => "document_date DESC")
      end

      def show
        @document = Document.find(params[:id])
      end

      def new
        @document = Document.new
      end

      def create
        @document = Document.new(params[:document])
        if @document.save
          flash[:notice] = "Successfully created documents."
          redirect_to @document
        else
          render :action => 'new'
        end
      end

      def edit
        @document = Document.find(params[:id])
      end

      def updategrid
        params.delete(:action)
        params.delete(:controller)
        params.delete(:oper)
        @document = Document.find(params[:rid])

        params.delete(:id)
        params.delete(:rid)

        if @document.update_attributes(params) then
          render :nothing => true
        end

      end

      def update
        @document = Document.find(params[:id])
        if @document.update_attributes(params[:document])
          flash[:notice] = "Successfully updated documents."
          redirect_to @document
        else
          render :action => 'edit'
        end
      end

      def destroy
        @document = Document.find(params[:id])
        @document.destroy
        flash[:notice] = "Successfully destroyed documents."
        redirect_to documents_url
      end
    end
