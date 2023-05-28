class ReviewsController < ApplicationController
  before_action :find_product
  before_action :find_review, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @product = Product.find(params[:product_id])
    @reviews = Reviews.product_id.all
  end

  def new
    @review = Review.new
    # @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      # flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to product_path(@product)
  end

  private

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
