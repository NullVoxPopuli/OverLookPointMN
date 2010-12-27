class Admin::LinkPagesController < BaseController


  # GET /link_pages
  # GET /link_pages.xml
  def index
    @link_pages = LinkPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @link_pages }
    end
  end

  # GET /link_pages/1
  # GET /link_pages/1.xml
  def show
    @link_page = LinkPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link_page }
    end
  end

  # GET /link_pages/new
  # GET /link_pages/new.xml
  def new
    @link_page = LinkPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link_page }
    end
  end

  # GET /link_pages/1/edit
  def edit
    @link_page = LinkPage.find(params[:id])
  end

  # POST /link_pages
  # POST /link_pages.xml
  def create
    @link_page = LinkPage.new(params[:link_page])
    @link_page.sequence = LinkPage::NOT_USED
    respond_to do |format|
      if @link_page.save
        flash[:notice] = 'LinkPage was successfully created.'
        format.html { redirect_to([:admin, @link_page]) }
        format.xml  { render :xml => @link_page, :status => :created, :location => @link_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /link_pages/1
  # PUT /link_pages/1.xml
  def update
    @link_page = LinkPage.find(params[:id])

    respond_to do |format|
      if @link_page.update_attributes(params[:link_page])
        flash[:notice] = 'LinkPage was successfully updated.'
        format.html { redirect_to(@link_page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /link_pages/1
  # DELETE /link_pages/1.xml
  def destroy
    @link_page = LinkPage.find(params[:id])
    @link_page.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "admin/link_pages", :action => :index) }
      format.xml  { head :ok }
    end
  end
  
  def load_page
    @page = LinkPage.find(params[:id])
    
    respond_to do |format|
      format.js do
        render :update do |p|
          p.replace_html("actual_content", :partial => "/shared_elements/local_page", :object => @page)
        end
      end
    end
  end
end
