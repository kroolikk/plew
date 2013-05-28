class PhotoTranslations < ActiveRecord::Migration
  def up
    Photo.create_translation_table!({
                                      p_title: :string,
                                    }, {
                                      migrate_data: true
                                    })    
  end
  
  def down
    Photo.drop_translation_table! migrate_data: true
  end
end
