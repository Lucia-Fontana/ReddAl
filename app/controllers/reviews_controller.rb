class ReviewsController < ApplicationController
  before_action :find_product
  before_action :find_review, only: [:edit, :update, :destroy]

  # Lists all reviews for a specific product
  def index
    @user = current_user
    @product = Product.find(params[:product_id])
    @reviews = Reviews.product_id.all
  end

  # Creates a new review
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  # Updates a specific review
  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  # Deletes a specific review
  def destroy
    @review.destroy
    redirect_to product_path(@product)
  end

  private
  # Allows to choose which attributes should be permitted for mass updating
  # and thus prevent accidentally exposing those ones that should be protected
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
