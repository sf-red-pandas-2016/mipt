require 'csv'

class StudentsController < ApplicationController
  
  before_filter :authorize

  def index
    @students = Student.all.sort_by &:last_name



    CSV.open("#{Date.today}.csv", "wb") do |csv|
      # Print headers to csv file
      csv << [
        "first_name",
        "last_name",
        "grade_level",
        "gender",
        "gpa",
        "number_of_detentions",
        "shirt_size"
      ]

      Student.all.each do |student|
        course = Course.find(student.course_id)
        csv << [
          student.first_name,
          student.last_name,
          student.grade_level,
          student.gender,
          student.gpa,
          student.number_of_detentions,
          student.shirt_size,
          course.id,
          course.title
        ]

      end
    end


  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :grade_level, :gender, :gpa, :number_of_detentions, :teacher_id, :shirt_size, :email, :interests)
    end

end
