class MachinesController < ApplicationController
  # GET /machines
  # GET /machines.json
  def index
    sort = {:sort_by => 'created_at', :order => 'asc'}
    case params[:sort_by]
    when 'name'
      sort[:sort_by] = 'name'
    end    
    case params[:order]
    when 'asc'
      sort[:order] = 'asc'
    when 'desc'
      sort[:order] = 'desc'
    end

    @machines = Machine.order("#{sort[:sort_by]} #{sort[:order]}").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @machines }
    end
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
    @machine = Machine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/new
  # GET /machines/new.json
  def new
    @machine = Machine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @machine }
    end
  end

  # GET /machines/1/edit
  def edit
    @machine = Machine.find(params[:id])
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = Machine.new(params[:machine])

    respond_to do |format|
      if @machine.save
        format.html { redirect_to @machine, notice: t('controller.successfully_created', :model => t('activerecord.models.machine')) }
        format.json { render json: @machine, status: :created, location: @machine }
      else
        format.html { render action: "new" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /machines/1
  # PUT /machines/1.json
  def update
    @machine = Machine.find(params[:id])

    respond_to do |format|
      if @machine.update_attributes(params[:machine])
        format.html { redirect_to @machine, notice: t('controller.successfully_updated', :model => t('activerecord.models.machine')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy

    respond_to do |format|
      format.html { redirect_to machines_url, notice: t('controller.successfully_deleted', :model => t('activerecord.models.machine')) }
      format.json { head :no_content }
    end
  end
end
