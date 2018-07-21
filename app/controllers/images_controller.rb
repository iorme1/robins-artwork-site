class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :show]

  def index
    @images = Image.all
    @sculptures = @images.where(category_id: 1)
    @photography = @images.where(category_id: 2)
    @paintings = @images.where(category_id: 3)
  end

  def show
  end

  def new
    @image = Image.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @image = Image.new(image_params)
    @image.category_id = params[:category_id]

    if @image.save
      flash[:notice] = "Artwork has been saved."
      redirect_to images_path
    else
      redirect_to images_path
      flash[:alert] = "Not saved. Please try again."
    end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @image.category_id = params[:category_id]
    if @image.update(image_params)
      redirect_to images_path
      flash[:notice] = "Artwork successfully updated."
    else
      flash[:alert] = "Artwork was not updated. Please try again."
    end
  end

  def destroy
    @image.destroy

    redirect_to images_path
    flash[:notice] = "Artwork removed."
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :title, :description, :category_id, :date)
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
