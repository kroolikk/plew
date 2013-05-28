class Vid < ActiveRecord::Base
  attr_protected :id
  
  translates :title, :description

  class Translation
    attr_accessible :locale
  end
end
