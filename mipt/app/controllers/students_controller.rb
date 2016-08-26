class StudentsController < ApplicationController
  def index
    @students = Student.all.sort_by &:last_name
    # @students.sort_by! { |student| student.last_name }
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
