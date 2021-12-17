class TechnologiesController < ApplicationController
  before_action :set_technology, only: %i[ show edit update destroy ]

  # GET /technologies
  def index
    @technologies = Technology.all
  end

  # GET /technologies/1
  def show
  end

  # GET /technologies/new
  def new
    @technology = Technology.new
  end

  # GET /technologies/1/edit
  def edit
  end

  # POST /technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to @technology, notice: "Technology was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /technologies/1
  def update
    if @technology.update(technology_params)
      redirect_to @technology, notice: "Technology was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /technologies/1
  def destroy
    @technology.destroy
    redirect_to technologies_url, notice: "Technology was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technology_params
      params.require(:technology).permit(:description, :developer, :duration)
    end
end
