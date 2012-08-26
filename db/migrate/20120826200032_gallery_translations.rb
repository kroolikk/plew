class GalleryTranslations < ActiveRecord::Migration
  def up
    Gallery.create_translation_table!({
                                     title: :string,
                                     description: :text
                                   }, {
                                     migrate_data: true
                                   })        
  end

  def down
    Gallery.drop_translation_table! migrate_data: true
  end
end
