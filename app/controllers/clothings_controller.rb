class ClothingsController < ApplicationController
  # before_action :set_clothing, only: [:show]
  # before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]
  # after_action :verify_policy_scoped, only: [:index, :index_vetements, :index_sous_vetements, :index_accessoires]
  def index
    @clothings = policy_scope(Clothing)
  end

  def index_vetements
    @clothings = Clothing.where(category: 'vetements')
    @clothing = Clothing.new
    # render :index_vetements
  end

  def index_sous_vetements
    @clothings = Clothing.where(category: 'sous-vetements')
    render :index_sous_vetements
  end

  def index_accessoires
    @clothings = Clothing.where(category: 'accessoires')
    render :index_accessoires
  end

  def show
    @clothing = Clothing.find(params[:id])
    authorize @clothing
  end

  def new
    @clothing = Clothing.new
  end

  def create
    # if current_user.nil?
    #   flash[:alert] = "You must be logged in to create a clothing."
    #   redirect_to login_path
    #   return
    # end
    # logger.debug "current_user: #{current_user.inspect}"
    @clothing = Clothing.new(clothing_params)
    authorize @clothing
    @clothing.user = current_user
    if @clothing.save
      redirect_to clothing_path(@clothing), notice: 'Clothing was successfully created.'
      #redirect_to vetements_clothings_path pour voir tous les vêtements que j'ai créé.
    else
      render :index_vetements, status: :unprocessable_entity
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
  end

  def update

    if @clothing.update(clothing_params)
      respond_to do |format|
        format.html { redirect_to clothing_path(@clothing), notice: 'Clothing was successfully updated.' }
        format.json { render json: { message: 'Clothing updated successfully' }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { errors: @clothing.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clothing = Clothing.find(params[:id])
    authorize @clothing
    @clothing.destroy
    redirect_to clothings_path, notice: 'Clothing was successfully destroyed.'
  end

  private

  # def set_clothing
  #   @clothing = Clothing.find(params[:id])
  # end

  # def authorize_admin
  #   authorize Clothing, :admin?
  # end

  def clothing_params
    params.require(:clothing).permit(:name, :description, :price, :available_sizes, :category, :photo, :user_id)
  end
end
