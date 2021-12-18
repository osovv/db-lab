class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    need_auth(url: products_path) do
      @product = Product.new(product_params)

      if @product.save
        redirect_to @product, notice: "Product was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    need_auth(url: @product) do
      if @product.update(product_params)
        redirect_to @product, notice: "Product was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /products/1
  def destroy
    need_auth(url: @product) do
      @product.destroy
      redirect_to products_url, notice: "Product was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:factory_id, :department_id, :technology_id, :name, :designation, :weight)
    end
end
