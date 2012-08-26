class Page < ActiveRecord::Base
  attr_protected :id

  translates :title, :content

  mount_uploader :photo, PhotoUploader

  class Translation
    attr_accessible :locale
  end
end
