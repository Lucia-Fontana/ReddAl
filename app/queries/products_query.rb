class ProductsQuery < Patterns::Query
  queries Product

  def call(products = Product.all)
    products
    .joins(:business)
    .where(availability: true)
  end

end
