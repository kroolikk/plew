class Photo < ActiveRecord::Base
  attr_accessible :gallery_id, :photo, :photo_cache, :created_at, :updated_at, :p_title, :position

  acts_as_list
  
  translates :p_title
  
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader

  class Translation
    attr_accessible :locale
  end

  def self.recreate_all_photos
    photos = Photo.all
    photos.each do |p|
      if p.photo.present?
        p.photo.cache_stored_file!
        p.photo.recreate_versions!
      end
    end
  end

end
