class ClothingsController < ApplicationController

  def index
    @clothings = Clothing.all
  end

  def vetement
    @clothing = Clothing.find(params[:id])
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      redirect_to @clothing, notice: 'Clothing was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
  end

  def update
    if @clothing.update(clothing_params)
      redirect_to @clothing, notice: 'Clothing was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @clothing = Clothing.find(params[:id])
    @clothing.destroy
    redirect_to @clothing, notice: 'Clothing was successfully destroyed.'
  end

  private

  def set_clothing
    @clothing = Clothing.find(params[:id])
  end

  def clothing_params
    params.require(:clothing).permit(:name, :description, :price, :photo)
  end
end
