class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new
    end
  end

  def update

    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
      redirect_to resumes_url, notice: 'Resume was successfully destroyed.'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:contact, :objective, :education, :experience, :skills, :references, :user_id)
    end
end
