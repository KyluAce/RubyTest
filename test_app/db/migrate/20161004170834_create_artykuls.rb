class CreateArtykuls < ActiveRecord::Migration
  def up
    create_table :artykuls do |t|

    	t.integer "page_id"
    	t.string  "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>true
    	t.text "content"
    	t.attachment :images

      t.timestamps null: false
    end
  end
  def down
	drop_table :artykuls
end
end
