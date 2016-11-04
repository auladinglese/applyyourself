class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end


  def show
  end


  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id

    if @job.save
      redirect_to @job, notice: 'Post was successfully created.'
    else
      render :new
    end
  end


  def update
      if @job.update(job_params)
        redirect_to @job, notice: 'Post was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @job.destroy
      redirect_to jobs_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :requirements, :benefits)
    end
end
