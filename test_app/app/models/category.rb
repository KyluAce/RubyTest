class Category < ActiveRecord::Base
has_many :stronas

		scope :visibility,  lambda{where(:visilibity => true)}
		scope :invisibility, lambda{where(:visilibity => false)}
		scope :sort,  lambda{order("categories.position ASC")}
		scope :najnowsza,  lambda{order("categories.created_at DESC")}

end
