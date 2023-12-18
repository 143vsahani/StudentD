class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student was successfully destroyed.'
  end

  def show_class
    @classes = Sclass.all
  # Ensure that the view is rendered
  render 'show_class'
  end

  def show_school
    # Add logic to retrieve school information if needed
    @schools = School.all
    render 'show_school'
  end

  def show_teacher
    @teachers = Teacher.all
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :class_id)
  end
end
