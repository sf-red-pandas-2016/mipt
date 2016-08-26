class CoursesController < ApplicationController
  def index
    @courses = Course.all.sort_by &:title
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

  def show
    @course = Course.find(params[:id])
    @course_students = @course.students
  end

  def destroy
    @course = Course.find(params[:id])

    @course.students.each do |student|
      student.course = nil
      student.save
    end

    @course.destroy

    redirect_to teachers_path
  end

   private
    def course_params
      params.require(:course).permit(:title, :description, :teacher_id)
    end
end
