class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :photo

      t.timestamps
    end
  end
end
