class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
    	t.string "name", :limit=> 20;
    	t.string "surname", :limit=> 20
    	t.string "user", :limit=> 20
    	t.string "email", :limit=> 50, :default=>"", :null=>false
    	t.string "tel", :limit=> 15, :default=>"", :null=>false
    	t.string "password_digest"

      t.timestamps null: false
    end
    add_index("users","user")
end
def down
	drop_table :users
end

end
