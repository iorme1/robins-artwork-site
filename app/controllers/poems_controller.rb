class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]

  def index
    @poems = Poem.all
  end

  def show
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.new(poem_params)

    if @poem.save
      flash[:notice] = "Poem has been saved"
      redirect_to poems_path
    else
      redirect_to poems_path
      flash[:alert] = "Not saved. Please try again."
    end
  end

  def update
    if @poem.update(poem_params)
      redirect_to poems_path
      flash[:notice] = "Poem successfully updated"
    else
      flash[:alert] = "Poem was not updated. Please try again."
    end
  end

  def destroy
    @poem.destroy

    redirect_to poems_path
    flash[:notice] = "Poem removed"
  end

  def edit
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:title, :date, :body)
  end
end
