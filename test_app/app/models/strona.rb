class Strona < ActiveRecord::Base
	belongs_to :category
	has_many :artykuls


		scope :visibility,  lambda{where(:visilibity => true)}
		scope :invisibility, lambda{where(:visilibity => false)}
		scope :sort,  lambda{order("stronas.position ASC")}
		scope :najnowsza,  lambda{order("stronas.created_at DESC")}
end
