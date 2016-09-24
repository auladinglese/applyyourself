class ReviewsController < ApplicationController
  before_filter :get_parent
   
  def index
    @reviews = Review.find(params[:review_id])
  end
  
  def show
    @reviews = Review.build(params[:review_id])
  end
  
  def new
    @review = @parent.reviews.build
  end

  def home
    @latest_feed = Resume.order(:id).last
  end

  def create
    @review = @parent.reviews.build(review_params)
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to resume_path(@review.resume), :notice => 'Thank you for your review!'
    else
      render :new
    end
  end
  
  def destroy  
    @review = Review.find(params[:id])

    @review.destroy
    redirect_to resume_path(@review.resume), notice: "Review deleted."
  end
 
  private
  
  def review_params
    params.require(:review).permit(:body)
  end
  
  def get_parent
    @parent = Resume.find_by_id(params[:resume_id]) if params[:resume_id]
    @parent = Review.find_by_id(params[:review_id]) if params[:review_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
