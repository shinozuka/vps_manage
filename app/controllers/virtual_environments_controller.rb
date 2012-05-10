class VirtualEnvironmentsController < ApplicationController

  def index
    @virtual_environments = VirtualEnvironment.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @virtual_environments }
    end
  end

  def show
    @virtual_environment = VirtualEnvironment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @virtual_environment }
    end
  end

  def new
    @virtual_environment = VirtualEnvironment.new
    @project_ids = []
    prepare_options

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @virtual_environment }
    end
  end

  def edit
    @virtual_environment = VirtualEnvironment.find(params[:id])
    @project_ids = @virtual_environment.projects.inject([]){ |ids, project| ids << project.id.to_i } rescue []
    prepare_options
  end

  def create
    @virtual_environment = VirtualEnvironment.new(params[:virtual_environment])
    @project_ids = params[:projects] ? params[:projects].inject([]){|ids, id| ids << id.to_i} : []

    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          @virtual_environment.save!
          @virtual_environment.add_project(@project_ids)
          format.html { redirect_to @virtual_environment, notice: t('controller.successfully_created', :model => t('activerecord.models.virtual_environment')) }
          format.json { render json: @virtual_environment, status: :created, location: @virtual_environment }
        end
      rescue
        prepare_options
        format.html { render action: "new" }
        format.json { render json: @virtual_environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @virtual_environment = VirtualEnvironment.find(params[:id])
    @project_ids = params[:projects] ? params[:projects].inject([]){|ids, id| ids << id.to_i} :[]
    
    respond_to do |format|
      begin
        ActiveRecord::Base.transaction do
          @virtual_environment.update_attributes!(params[:virtual_environment])
          @virtual_environment.add_project(@project_ids)
          format.html { redirect_to @virtual_environment, notice: t('controller.successfully_updated', :model => t('activerecord.models.virtual_environment')) }
          format.json { head :no_content }
        end
      rescue
        prepare_options
        format.html { render action: "edit" }
        format.json { render json: @virtual_environment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @virtual_environment = VirtualEnvironment.find(params[:id])
    @virtual_environment.destroy

    respond_to do |format|
      format.html { redirect_to virtual_environments_url, notice: t('controller.successfully_deleted', :model => t('activerecord.models.virtual_environment')) }
      format.json { head :no_content }
    end
  end

  private
  def prepare_options
    @machines = Machine.all
    @projects = Project.all
  end
end
