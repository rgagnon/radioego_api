class Audio < ActiveRecord::Base
  self.table_name = 'medias'

  belongs_to :user

  attr_accessible :title, :id, :description, :keyword

  def self.fetch_audios_and_users
    Audio.all(:limit => 20, :select => ['medias.id', 'medias.title', 'medias.duration', 'medias.description', 'medias.user_id', 'users.firstname', 'users.lastname', 'users.avatar_file_name'], :joins => :user, :order => 'id desc')
  end

end

