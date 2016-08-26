class StudentsController < CoursesController
  #list of all students currently enrolled in course
  def index
    @students = Student.where(course_id: params[:course_id])
  end

  #page shows all students with buttons to add to course
  def new
    @students = Student.all
  end

  #route when selected to add to course, update student's course_id to the current course_id
  def update
    student = Student.find(params[:id])
  end

  private
    def student_params
      params_require(:student).permit(:course_id)
    end
end
