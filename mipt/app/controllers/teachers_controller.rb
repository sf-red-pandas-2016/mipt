class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all.sort_by &:full_name
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    redirect_to teachers_path
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    p teacher_params
    if @teacher.update(teacher_params)
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  private
    def teacher_params
      params.require(:teacher).permit(:full_name)
    end

end
