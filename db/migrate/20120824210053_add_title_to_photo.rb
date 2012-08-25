class AddTitleToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :p_title, :string
  end
end
