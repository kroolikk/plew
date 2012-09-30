class Gallery < ActiveRecord::Base
  attr_protected :id
  
  translates :title, :description
  
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? && a[:p_title].blank? }, :allow_destroy => true
  
  class Translation
    attr_accessible :locale
  end

  mount_uploader :icon, IconUploader


  def sorted_photos
      photos = Photo.where(:gallery_id => self.id).order("position ASC")
      return photos
  end
end
