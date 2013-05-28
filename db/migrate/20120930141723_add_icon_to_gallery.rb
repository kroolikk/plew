class AddIconToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :icon, :string
  end
end
