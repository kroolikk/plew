class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :section
      t.string :gal_type
      t.string :label
      t.string :title

      t.timestamps
    end
  end
end
