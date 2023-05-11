class ProductsController < ApplicationController

  # skip_before_action :authenticate_user!, only: :index, :toggle_favorite

  def index
    if params[:query].present?
      sql_query = <<~SQL
        products.description ILIKE :query
        OR businesses.address ILIKE :query
        OR businesses.name ILIKE :query
      SQL
      @products = Product.joins(:business).where(sql_query, query: "%#{params[:query]}%").where(availability: true)
      @products = Product.where(availability: true) if @products.length.zero?
    else
      @products = Product.where(availability: true)
    end
  end

  def show
    @product = Product.find(params[:id])
    @markers = [{
      lat: @product.business.latitude,
      lng: @product.business.longitude,
      info_window: render_to_string(partial: "info_window", locals: { business: @product.business })
    }]
  end

  def new
    if current_user.category == "Attività"
      @product = Product.new
    else
      flash.alert = "Not allowed." #quick fix as Pundit is not used
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    @product.business = current_user.business
    if @product.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to dashboard_path, notice: "The item has been successfully removed"
  end

  def toggle_favorite
    @product = Product.find_by(id: params[:id])
    current_user.favorited?(@product) ? current_user.unfavorite(@product) : current_user.favorite(@product)
  end

  def favorites
    @products = Product.all
    @favorite_products = current_user.favorited_by_type('Product')
  end

  private

  def product_params
    params.require(:product).permit(:description, :deadline, :co2e, :quantity, :price, :business_id, :photo)
  end
end
