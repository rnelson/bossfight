class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.status = Constants.get_status_id(:new)
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    user = User.find_by_id(@project.employee_id)

    @project.priority = user.projects.count + 1
    @project.category_id = params[:project][:category_id] # TODO: bug
    @project.due_at = params[:project][:due_at] if not params[:project][:due_at].nil? # TODO: bug
    @project.modified_at = DateTime.now

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: "Project #{@project.name} was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.category_id = params[:project][:category_id] # TODO: bug
    @project.due_at = params[:project][:due_at] if not params[:project][:due_at].nil? # TODO: bug
    @project.modified_at = DateTime.now

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: "Project #{@project.name} was successfully update." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    name = @project.name
    @project.status = Constants.get_status_id(:deleted)
    @project.modified_at = DateTime.now
    @project.save

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project #{name} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def update_priorities
    employee = User.find_by_id(params[:employee_id])

    params[:priorities].each do |project_id, priority|
      p = Project.find_by_id(project_id)
      p.priority = priority
      p.save
    end

    redirect_to projects_url, notice: "Priorities saved for #{employee.name.possessive} projects."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :status, :priority, :boss_id, :employee_id)
    end
end
