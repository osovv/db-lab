class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]

  # GET /parts
  def index
    @parts = Part.all
  end

  # GET /parts/1
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts
  def create
    need_auth(url: parts_path) do
      @part = Part.new(part_params)

      if @part.save
        redirect_to @part, notice: "Part was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /parts/1
  def update
    need_auth(url: @part) do
      if @part.update(part_params)
        redirect_to @part, notice: "Part was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /parts/1
  def destroy
    need_auth(url: @part) do
      @part.destroy
      redirect_to parts_url, notice: "Part was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_params
      params.require(:part).permit(:name, :product_id, :weight, :dimensions, :vendor_id, :ship_date)
    end
end
