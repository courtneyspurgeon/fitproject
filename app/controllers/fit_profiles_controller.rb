class FitProfilesController < ApplicationController
  # GET /fit_profiles
  # GET /fit_profiles.json
  def index
    @fit_profiles = FitProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fit_profiles }
    end
  end

  # GET /fit_profiles/1
  # GET /fit_profiles/1.json
  def show
    @fit_profile = FitProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fit_profile }
    end
  end

  # GET /fit_profiles/new
  # GET /fit_profiles/new.json
  def new
    @fit_profile = FitProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fit_profile }
    end
  end

  # GET /fit_profiles/1/edit
  def edit
    @fit_profile = FitProfile.find(params[:id])
  end

  # POST /fit_profiles
  # POST /fit_profiles.json
  def create
    @fit_profile = FitProfile.new(params[:fit_profile])

    respond_to do |format|
      if @fit_profile.save
        format.html { redirect_to @fit_profile, :notice => 'Fit profile was successfully created.' }
        format.json { render :json => @fit_profile, :status => :created, :location => @fit_profile }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fit_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fit_profiles/1
  # PUT /fit_profiles/1.json
  def update
    @fit_profile = FitProfile.find(params[:id])

    respond_to do |format|
      if @fit_profile.update_attributes(params[:fit_profile])
        format.html { redirect_to @fit_profile, :notice => 'Fit profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fit_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fit_profiles/1
  # DELETE /fit_profiles/1.json
  def destroy
    @fit_profile = FitProfile.find(params[:id])
    @fit_profile.destroy

    respond_to do |format|
      format.html { redirect_to fit_profiles_url }
      format.json { head :no_content }
    end
  end
end
