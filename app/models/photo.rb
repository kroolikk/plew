class Photo < ActiveRecord::Base
  attr_protected :id
  
  translates :p_title
  
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader

  class Translation
    attr_accessible :locale
  end
end
