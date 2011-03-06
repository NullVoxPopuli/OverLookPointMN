class Admin::LinkPagesController < ApplicationController


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

  def home
    @page = LinkPage.find_by_name("Home")
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
        @link_pages = LinkPage.find(:all, :conditions => "sequence = #{LinkPage::NOT_USED}", :order => :sequence)

  end

  # POST /link_pages
  # POST /link_pages.xml
  def create
    @link_page = LinkPage.new(params[:link_page])
    @link_page.sequence = LinkPage::NOT_USED
    respond_to do |format|
      if @link_page.save
        flash[:notice] = 'LinkPage was successfully created.'
        format.html { redirect_to(:controller => :site_prefs, :action => :index) }
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
        format.html { redirect_to(:controller => :site_prefs, :action => :index) }
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
      format.html { redirect_to(:controller => :site_prefs, :action => :index) }
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
  
  def convert_to_sub_menu
    @link_page = LinkPage.find(params[:id])
    @link_pages = LinkPage.find(:all, :conditions => "sequence = #{LinkPage::NOT_USED}", :order => :sequence)
    
    respond_to do |format|
      format.js do
        render :update do |p|
          p.replace_html("sub_menu_editor_holder", :partial => "/admin/link_pages/sub_pages")
          p.replace_html("stuff_to_remove", "")
          p.replace_html("convert_to_sub_menu_link", "")
        end
      end
    end
  end
  
  def remove_sub_pages
   @link_page = LinkPage.find(params[:id])
   # delete all sub_pages
  end
  
  def remove_page_from_sub_menu
    @link_page = LinkPage.find(params[:id])
    page = LinkPage.find(params[:page])
    
    page.sequence = LinkPage::NOT_USED
    page.save
    @link_page.sub_pages.delete(page)
    
    if @link_page.save
      redirect_to :controller => "admin/link_pages", :action => "edit", :id => @link_page.id
    else
      flash[:notice] = "something bad happened when removing the page"
    end
  end
  
  def add_page_to_sub_menu
    @link_page = LinkPage.find(params[:id])
    page = LinkPage.find(params[:page])
    if @link_page.id = page.id
      flash[:notice] = "you may not add a sub menu to itself (the universe breaks if that happens)"
    else
      page.sequence = @link_page.sub_pages.size + 1
      page.save
    
      @link_page.sub_pages << page
    
      if @link_page.save
        redirect_to :controller => "admin/link_pages", :action => "edit", :id => @link_page.id
      else
        flash[:notice] = "something bad happened when adding the page"
      end
    end
  end
  
  
end
