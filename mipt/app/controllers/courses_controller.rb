class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
  	@course = Course.new(course_params)

    if @course.save
  		redirect_to @course
  	else
  		render 'new'
  	end
  end

   private
    def course_params
      params.require(:course).permit(:title, :description, :teacher_id)
    end
end
