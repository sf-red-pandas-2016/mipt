class CoursesController < ApplicationController
    
  before_filter :authorize

  def index
    @courses = Course.all.sort_by &:title
  end

  def students_add
    @course = Course.find(params[:course_id])
    @students = Student.all.sort_by &:last_name
  end

  def students_show
    @course = Course.find(params[:course_id])
    @students = Student.where(course_id: params[:course_id])
  end

  def students_update
    @student = Student.find(params[:student_id])
    @student.course_id = params[:course_id]
    if @student.save
      redirect_to "/courses/#{params[:course_id]}"
    else
      p @student.errors.full_messages
      # add else to render later
    end
  end

  def students_destroy
    student = Student.find(params[:student_id])
    p "8" * 30
    p student
    student.course_id = nil
    student.save
    p "*" * 30
    p student
    redirect_to "/courses/#{params[:course_id]}"
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
    p "X" * 45
    p @course_students
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

    def student_params
      params.require(:student).permit(:course_id)
    end
end
