class AudiosController < ApplicationController
  def index
    @audios = Audio.all(:limit => 20, :select => [:id, :title, :user_id], :order => 'id desc')
    render json: @audios
  end
end