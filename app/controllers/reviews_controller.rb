class ReviewsController < ApplicationController

 def create
    puts current_user
    @product = Product.find params[:product_id]
    @review = @product.reviews.new review_params
    if current_user
     @review.user = current_user
    end

    if @review.save
      redirect_to @product, notice: "Review created"
    else
      redirect_to @product, notice: "There was an error creating the review: #{@review.errors.full_messages}"
    end

  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
