class SclassesController < ApplicationController
    before_action :set_sclass, only: [:show, :edit, :update, :destroy]

  def index
    @sclasses = Sclass.all
  end

  def show
    @sclass = Sclass.find(param[:id])
  
  end

  def new
    @sclass = Sclass.new
  end

  def create
    @sclass = Sclass.new(sclass_params)
  
    if @sclass.save
      # Handle successful save
      puts "save"
    else
      # Handle validation errors
      puts "errors"
    end
  end

  def edit
  end

  def update
    if @sclass.update(sclass_params)
      redirect_to sclasses_path, notice: 'Class was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sclass.destroy
    redirect_to sclasses_path, notice: 'Class was successfully destroyed.'
  end

  private

  def set_sclass
    @sclass = Sclass.find(params[:id])
  end

  def sclass_params
    params.require(:sclass).permit(:classNumber,:department, :division, :school_id, :assignments)
  end
end
