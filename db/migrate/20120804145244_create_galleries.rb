class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :owner
      t.string :label
      t.string :title

      t.timestamps
    end
  end
end
