class User < ActiveRecord::Base

  has_many :media

  # Protecting the fields
  attr_accessible :login, :email, :image, :firstname, :lastname, :dateofbirth, :city, :phone, :user_type_id

end
