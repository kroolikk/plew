class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :section
      t.string :label
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
