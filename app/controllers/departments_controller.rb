class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]

  # GET /departments
  def index
    @departments = Department.all
  end

  # GET /departments/1
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  def create
    need_auth(url: departments_path) do
      @department = Department.new(department_params)

      if @department.save
        redirect_to @department, notice: "Department was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /departments/1
  def update
    need_auth(url: @department) do
      if @department.update(department_params)
        redirect_to @department, notice: "Department was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /departments/1
  def destroy
    need_auth(url: @department) do
      @department.destroy
      redirect_to departments_url, notice: "Department was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:factory_id, :chief_name)
    end
end
