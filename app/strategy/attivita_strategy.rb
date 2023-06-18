class AttivitaStrategy < Strategy
  def call
    @products = Product.new
  end
end
