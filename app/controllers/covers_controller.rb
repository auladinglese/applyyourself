class CoversController < ApplicationController
  before_action :set_cover, only: [:show, :edit, :update, :destroy]
  before_filter :get_parent

  def index
    @covers = Cover.find(params[:cover_id])
  end

  def show
    @covers = Cover.build(params[:cover_id])
  end

  def new
    @cover = @parent.covers.build
  end

  def edit
  end

  def create
    @cover = @parent.covers.build(cover_params)
    @cover.user_id = current_user.id

    if @cover.save
      redirect_to job_path(@cover.job), notice: 'Thank you!'
    else
      render :new
    end
  end

  def update
    @cover = Cover.find(params[:id])

    if @cover.update(cover_params)
      redirect_to job_path(@cover.job), notice: 'Update successful.'
    else
      render :edit
    end
  end

  def destroy
    @cover = Cover.find(params[:id])

    @cover.destroy
      redirect_to job_path(@cover.job), notice: 'Successfully deleted.'
  end

  private
    def set_cover
      @cover = Cover.find(params[:id])
    end

    def cover_params
      params.require(:cover).permit(:letter, :user_id, :job_id)
    end

    def get_parent
    @parent = Job.find_by_id(params[:job_id]) if params[:job_id]
    @parent = Cover.find_by_id(params[:cover_id]) if params[:cover_id]
     
    redirect_to root_path unless defined?(@parent)
  end
end
