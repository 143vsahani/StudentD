class SchoolsController < ApplicationController
    before_action :set_school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: 'School was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to schools_path, notice: 'School was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @school = School.find_by(id: params[:id])
    if @school.present?
      @school.destroy
      redirect_to schools_path, notice: 'School was successfully destroyed.'
    end
    # redirect_to schools_path, notice: 'School was successfully destroyed.'
  end

  # def destroy
  #   @product = Product.find_by(id: params[:id])
  #     if @product.present?
  #       @product.destroy
  #       redirect_to root_path, notice: ' Confirmed Successfully'
  #     end
  # end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:board, :schoolName, :principalName)
  end
end
