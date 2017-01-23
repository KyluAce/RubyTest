class CreatePictures < ActiveRecord::Migration
  def up
    create_table :pictures do |t|

    	t.integer "galerie_id"
    	t.string "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>true
    	t.string "description"
    	t.attachment :picture


      t.timestamps null: false
    end
  end
  def down
  	drop_table :pictures
  end
end
