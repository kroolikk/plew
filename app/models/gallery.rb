class Gallery < ActiveRecord::Base
  attr_protected :id

  translates :title, :description
  
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? && a[:p_title].blank? }, :allow_destroy => true
  
  class Translation
    attr_accessible :locale
  end
end
