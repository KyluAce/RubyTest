class CreateStronas < ActiveRecord::Migration
  def change
    create_table :stronas do |t|

		t.integer "category_id"
    	t.string  "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>true

      t.timestamps null: false
    end
        add_index("stronas", "category_id")
  end
    def down
  	drop_table :stronas
  end
end




