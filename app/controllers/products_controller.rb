class ProductsController < ApplicationController
  # If the user is logged in as retailer (Attività)
  # then lists only the items still available, offered by that specific retailer
  # else if the user is logged in as customer (Utente)
  # lists only the items that can be purchased by that specific user
  # (every customer has a specific number of family units and therefore
  # is allowed to buy only specific box sizes,
  # i.e. nucleo == 3 -> only medium boxes purchasable)
  def index
    if current_user.category == "Attività"
      # Query design pattern
      @products = ProductsQuery.call.where(business: current_user.business)
    else
      # Query for search box
      if params[:query].present?
        sql_query = <<~SQL
          products.note ILIKE :query
          OR businesses.address ILIKE :query
        SQL
        # @products = Product.joins(:business).where(sql_query, query: "%#{params[:query]}%").where(availability: true).where(size: current_user.nucleo)
        @products = ProductsQuery.call.where(sql_query, query: "%#{params[:query]}%").where(size: current_user.nucleo)
      else
        # if the query's result is empty, shows an empty page
        @products = ProductsQuery.call.where(size: current_user.nucleo)
      end
    end
  end

  # Displays for a specific product its features, the location on the map
  # and the reviews' average, that starts from zero
  def show
    @product = Product.find(params[:id])
    @markers = [{
      lat: @product.business.latitude,
      lng: @product.business.longitude,
      info_window: render_to_string(partial: "info_window", locals: { business: @product.business })
    }]
    if @product.reviews.blank?
      @average_review = 0
    else
      @average_review = @product.reviews.average(:rating).round(2)
    end
  end

  # If the user is logged in as retailer (Attività)
  # allows to create a new product offer
  # as alternative Pundit gem can be used
  def new
    if current_user.category == "Attività"
      @product = Product.new
    else
      @products = UtenteStrategy.call
    end
  end

  def create
    @product = Product.new(product_params)
    @product.business = current_user.business
    if @product.save
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Allows to update the features of an existing product
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to dashboard_path, notice: "The item has been successfully removed"
  end

  # Lists products marked as favourites
  # def toggle_favorite
  #   @product = Product.find_by(id: params[:id])
  #   current_user.favorited?(@product) ? current_user.unfavorite(@product) : current_user.favorite(@product)
  # end

  # def favorites
  #   @products = Product.all
  #   @favorite_products = current_user.favorited_by_type('Product')
  # end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  # in this case 'description', 'deadline', 'co2e', 'quantity', 'price',
  # 'business_id', 'photo', 'size'
  def product_params
    params.require(:product).permit(:description, :note, :deadline, :co2e, :quantity, :price, :business_id, :photo, :size)
  end
end
