class Page < ActiveRecord::Base
  attr_protected :id

  translates :title, :content

  mount_uploader :photo, PhotoUploader

  class Translation
    attr_accessible :locale
  end

  def to_param
    if self.label == Page::PAGE_LABELS[0][1] && self.title.present?
      "#{self.id}-#{self.title.to_permalink}"
    else
      self.id
    end
  end
end
