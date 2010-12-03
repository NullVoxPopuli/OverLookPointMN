class Admin::MenuBarsController < ApplicationController
  # GET /menu_bars
  # GET /menu_bars.xml
  def index
    @menu_bars = MenuBar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_bars }
    end
  end

  # GET /menu_bars/1
  # GET /menu_bars/1.xml
  def show
    @menu_bar = MenuBar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_bar }
    end
  end

  # GET /menu_bars/new
  # GET /menu_bars/new.xml
  def new
    @menu_bar = MenuBar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_bar }
    end
  end

  # GET /menu_bars/1/edit
  def edit
    @menu_bar = MenuBar.find(params[:id])
    @link_pages = LinkPage.all
  end

  # POST /menu_bars
  # POST /menu_bars.xml
  def create
    @menu_bar = MenuBar.new(params[:menu_bar])

    respond_to do |format|
      if @menu_bar.save
        format.html { redirect_to([:admin, @menu_bar], :notice => 'MenuBar was successfully created.') }
        format.xml  { render :xml => @menu_bar, :status => :created, :location => @menu_bar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_bar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_bars/1
  # PUT /menu_bars/1.xml
  def update
    @menu_bar = MenuBar.find(params[:id])

    respond_to do |format|
      if @menu_bar.update_attributes(params[:menu_bar])
        format.html { redirect_to(@menu_bar, :notice => 'MenuBar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_bar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_bars/1
  # DELETE /menu_bars/1.xml
  def destroy
    @menu_bar = MenuBar.find(params[:id])
    @menu_bar.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "admin/menu_bars", :action => :index) }
      format.xml  { head :ok }
    end
  end
end
