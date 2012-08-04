class Photo < ActiveRecord::Base
  # attr_accessible :gallery_id, :photo
  attr_protected :id
  
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader
  
end
