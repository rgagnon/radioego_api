class AudiosController < ApplicationController
  def index
    @audios = Audio.fetch_audios_and_users
    render json: @audios
  end
  def show
    @audio = Audio.find(params[:id])
    render json: @audi
  end

end