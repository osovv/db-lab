class FactoriesController < ApplicationController
  before_action :set_factory, only: %i[ show edit update destroy ]

  # GET /factories
  def index
    @factories = Factory.all
  end

  # GET /factories/1
  def show
  end

  # GET /factories/new
  def new
    @factory = Factory.new
  end

  # GET /factories/1/edit
  def edit
  end

  # POST /factories
  def create
    need_auth(url: factories_path) do
      @factory = Factory.new(factory_params)

      if @factory.save
        redirect_to @factory, notice: "Factory was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /factories/1
  def update
    need_auth(url: @factory) do
      if @factory.update(factory_params)
        redirect_to @factory, notice: "Factory was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /factories/1
  def destroy
    need_auth(url: @factory) do
      @factory.destroy
      redirect_to factories_url, notice: "Factory was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def factory_params
      params.require(:factory).permit(:name, :address, :director_name)
    end
end
