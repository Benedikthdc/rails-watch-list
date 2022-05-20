class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@review.list)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
