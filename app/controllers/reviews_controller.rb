class ReviewsController < ApplicationController

  def index
    @user=current_user
    @product = Product.find(params[:product_id])
    @reviews = Reviews.product_id.all
  end

  def new
    @review = Review.new
    # @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to new_review_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
