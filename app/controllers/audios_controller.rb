class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy ]
  before_action :authorize_user, except: [:index, :show]
  
  def index
    @audios = Audio.all
  end

  def show
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)

    if @audio.save
      flash[:notice] = "Song has been saved"
      redirect_to audios_path
    else
      redirect_to audios_path
      flash[:alert] = "Not saved. Please try again."
    end
  end

  def edit
  end

  def update
    if @audio.update(audio_params)
      redirect_to audios_path
      flash[:notice] = "Song successfully updated"
    else
      flash[:alert] = "Song was not updated. Please try again."
    end
  end

  def destroy
    @audio.destroy

    redirect_to audios_path
    flash[:notice] = "Song removed"
  end

  private

  def set_audio
    @audio = Audio.find(params[:id])
  end

  def audio_params
    params.require(:audio).permit(:audio, :title, :date)
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end
