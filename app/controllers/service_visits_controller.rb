class ServiceVisitsController < ApplicationController
  before_filter :find_vehicle

  # GET /service_visits
  # GET /service_visits.xml
  def index
    @service_visits = ServiceVisit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_visits }
    end
  end

  # GET /service_visits/1
  # GET /service_visits/1.xml
  def show
    @service_visit = ServiceVisit.find(params[:id])
    @service_job = ServiceJob.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_visit }
    end
  end

  # GET /service_visits/new
  # GET /service_visits/new.xml
  def new
    @service_visit = ServiceVisit.new(:vehicle => @vehicle)
    @service_visit.service_jobs.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_visit }
    end
  end

  # GET /service_visits/1/edit
  def edit
    @service_visit = ServiceVisit.find(params[:id])
  end

  # POST /service_visits
  # POST /service_visits.xml
  def create
    @service_visit = ServiceVisit.new(params[:service_visit])

    respond_to do |format|
      if @service_visit.save
        @service_visit.update_vehicle_mileage
        flash[:notice] = 'ServiceVisit was successfully created.'
        format.html { redirect_to(@service_visit) }
        format.xml  { render :xml => @service_visit, :status => :created, :location => @service_visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_visits/1
  # PUT /service_visits/1.xml
  def update
    @service_visit = ServiceVisit.find(params[:id])

    respond_to do |format|
      if @service_visit.update_attributes(params[:service_visit])
        flash[:notice] = 'ServiceVisit was successfully updated.'
        format.html { redirect_to(@service_visit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_visits/1
  # DELETE /service_visits/1.xml
  def destroy
    @service_visit = ServiceVisit.find(params[:id])
    @service_visit.destroy

    respond_to do |format|
      format.html { redirect_to(service_visits_url) }
      format.xml  { head :ok }
    end
  end
  
private
  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
end
