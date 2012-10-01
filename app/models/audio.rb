class Audio < ActiveRecord::Base
  self.table_name = 'medias'

  #acts_as_likeable

  #has_one :site
  belongs_to :user
  #belongs_to :user_legacy

  #acts_as_taggable
  #acts_as_taggable_on :keyword

  attr_accessible :title, :id, :description, :keyword

  #define_index do
  #  indexes title
  #  indexes keyword
  #  indexes description
  #
  #  has id, created_at, updated_at
  #  set_property :delta => true
  #end
  #
  #attr_accessor :record_boost
  #attr_writer :title_boost
  #
  #def title_boost
  #  @title_boost || 1
  #end
  #
  #validates_presence_of :title, :message => "Le titre est obligatoire"
  #validates_presence_of :description, :message => "Vous devez ecrire une description"
  #validates_presence_of :keyword, :message => "Vous devez inscrire au moins un mot cle. Si vous en inscrivez plus d'un, separez-les par une virgule."
  ##validates_length_of :description, :maximum=> 275, :message => "La description ne peut depasser 255 caracteres."
  #validates_presence_of :uploaded_data, :message => "^Vous devez specifier un fichier audio mp3."
  #
  #has_attached_file :uploaded_data, :storage => :filesystem, :path_prefix => 'public/files', :less_than => 20.megabytes
  #
  ##validates_attachment_content_type :uploaded_data, :content_type=>['audio/mpeg', 'audio/aac', 'audio/mpeg3', 'audio/x-mpeg', 'audio/mp3']
  #
  ##The real name of the audio
  #def full_filename(thumbnail = nil)
  #  file_system_path = (thumbnail ? thumbnail_class : self).attachment_options[:path_prefix].to_s
  #  File.join(Rails.root, file_system_path, self.user_id.to_s, self.id.to_s + '.mp3')
  #end

end

