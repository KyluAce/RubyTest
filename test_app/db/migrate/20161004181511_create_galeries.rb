class CreateGaleries < ActiveRecord::Migration
  def up
    create_table :galeries do |t|

    	t.string  "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>true
    	t.text "content"
    	t.attachment :pictures

      t.timestamps null: false
    end
  end
  def down
	drop_table :galeries
end
end
