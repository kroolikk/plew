class Photo < ActiveRecord::Base
  attr_protected :id

  acts_as_list
  
  translates :p_title
  
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader

  class Translation
    attr_accessible :locale
  end
end
