class CoursesController < ApplicationController
  def index
  end

  def new

  end

  def create
  	@course = Course.new(course_params)
  	p "*" * 40
  	p "in create"
  	
  	if @course.save
  		p "in course.save"
  		redirect_to @course
  	else
  		p "in the else statement"
  		render 'new'
  	end
  end

   private
    def course_params
      params.require(:course).permit(:title, :description)
    end
end
