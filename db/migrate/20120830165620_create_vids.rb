class CreateVids < ActiveRecord::Migration
  def change
    create_table :vids do |t|
      t.string :section
      t.string :title
      t.text :description
      t.text :link_to_vid

      t.timestamps
    end

    Vid.create_translation_table!({
                                    title: :string,
                                    description: :text
                                  }, {
                                    migrate_data: true
                                  })    
  end
end
