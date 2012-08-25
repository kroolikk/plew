class Gallery < ActiveRecord::Base
  attr_protected :id
  
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? && a[:p_title].blank? }, :allow_destroy => true
  
end
