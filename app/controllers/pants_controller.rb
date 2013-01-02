class PantsController < ApplicationController
  # GET /pants
  # GET /pants.json
  def index
    @pants = Pant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pants }
    end
  end

  # GET /pants/1
  # GET /pants/1.json
  def show
    @pant = Pant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pant }
    end
  end

  # GET /pants/new
  # GET /pants/new.json
  def new
    @pant = Pant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pant }
    end
  end

  # GET /pants/1/edit
  def edit
    @pant = Pant.find(params[:id])
  end

  # POST /pants
  # POST /pants.json
  def create
    @pant = Pant.new(params[:pant])

    respond_to do |format|
      if @pant.save
        format.html { redirect_to @pant, :notice => 'Pant was successfully created.' }
        format.json { render :json => @pant, :status => :created, :location => @pant }
      else
        format.html { render :action => "new" }
        format.json { render :json => @pant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pants/1
  # PUT /pants/1.json
  def update
    @pant = Pant.find(params[:id])

    respond_to do |format|
      if @pant.update_attributes(params[:pant])
        format.html { redirect_to @pant, :notice => 'Pant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @pant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pants/1
  # DELETE /pants/1.json
  def destroy
    @pant = Pant.find(params[:id])
    @pant.destroy

    respond_to do |format|
      format.html { redirect_to pants_url }
      format.json { head :no_content }
    end
  end
end
