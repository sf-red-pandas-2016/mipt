class StudentsController < ApplicationController
  def index
    @students = Student.all.sort_by &:last_name
    # @students.sort_by! { |student| student.last_name }
  end

  def show
    @student = Student.find(params[:id])
  end
end
