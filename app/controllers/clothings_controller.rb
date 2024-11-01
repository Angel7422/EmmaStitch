class ClothingsController < ApplicationController
  # before_action :set_clothing, only: [:index, :vetement]
  before_action :authorize_clothing, only: [:new, :edit, :create, :edit, :update, :destroy]

  def index
    @clothing = policy_scope(Clothing)
    @clothing = Clothing.all
  end

  def vetement
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def new
    @clothing = Clothing.new
    authorize @clothing
  end

  def create
    @clothing = Clothing.new(clothing_params)
    @clothing.user = current_user
    authorize @clothing
    if @clothing.save
      redirect_to clothing_path(@clothing), notice: 'Clothing was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @clothing
    @clothing = Clothing.find(params[:id])
  end

  def update
    authorize @clothing
    if @clothing.update(clothing_params)
      redirect_to clothing_path(@clothing), notice: 'Clothing was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @clothing
    @clothing = Clothing.find(params[:id])
    @clothing.destroy
    redirect_to clothing_path(@clothing), notice: 'Clothing was successfully destroyed.'
  end

  private

  # def set_clothing
  #   @clothing = Clothing.find(params[:id])
  # end

  def authorize_clothing
    authorize Clothing
  end

  def clothing_params
    params.require(:clothing).permit(:name, :description, :price, :photo)
  end
end
