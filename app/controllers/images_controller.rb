class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show

  end

  def new
    @image = Image.new
  end

  def create
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :title, :description, :category_id, :date)
  end
end
