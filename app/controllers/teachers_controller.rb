# app/controllers/teachers_controller.rb
class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  
    def index
      @teachers = Teacher.all
    end
  
    def show
      @teachers = Teacherchool.all
      render 'show_teacher'
    end
  
    def new
      @teacher = Teacher.new
    end
  
    def create
      @teacher = Teacher.new(teacher_params)
  
      if @teacher.save
        redirect_to teachers_path, notice: 'Teacher was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @teacher.update(teacher_params)
        redirect_to teachers_path, notice: 'Teacher was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @teacher.destroy
      redirect_to teachers_path, notice: 'Teacher was successfully destroyed.'
    end

# show class
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

  def show_student
    @teachers = Teacher.all
    render 'show_teacher'
  end

  
    private
  
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
  
    def teacher_params
      params.require(:teacher).permit(:name, :email, :contactNumber)
    end
  end
  