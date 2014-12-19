class ReviewsController < ApplicationController


  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant_id = params[:restaurant_id]
    @restaurant = Restaurant.where(params[:restaurant_id])
    @review = Review.new(rev_params)
    @review.restaurant_id = @restaurant_id

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end



  private

    def rev_params
      params.require(:review).permit(:body, :rating)
    end
end
