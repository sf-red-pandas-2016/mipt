class CoursesController < ApplicationController
  def index
  end

  def new

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
      params.require(:course).permit(:title, :description)
    end
end
