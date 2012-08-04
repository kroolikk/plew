class Page < ActiveRecord::Base
  # attr_accessible :content, :label, :owner, :title
  attr_protected :id

  PAGE_LABELS = [["Kontakt", "contact"],
                 ["Recenzje", "review"]]
end
