class SclassesController < ApplicationController
    before_action :set_sclass, only: [:show, :edit, :update, :destroy]

  def index
    @sclasses = Sclass.all
  end

  def show
  end

  def new
    @sclass = Sclass.new
  end

  def create
    @sclass = Sclass.new(sclass_params)

    if @sclass.save
      redirect_to sclasses_path, notice: 'Class was successfully created.'
    else
      render :new
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
    params.require(:sclass).permit(:name)
  end
end
