class Galery < ActiveRecord::Base
	has_many :pictures


	has_attached_file :pictures,
					  :styles => {:medium => "600x600>", :thumb => "200x200>" }
 	
 	validates_attachment_content_type :pictures,
									  :content_type => /^image\/(png|gif|jpeg)/,
									  :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

	validates_attachment_size   :pictures,	
								:in	=> 0..850.kilobytes,
								:message => '--- za duży plik max rozmiar to 850 kB ----'	


	validates :name,
			  :presence => true,
			  :length => {:maximum => 120, :message => "Za długi tytuł"}	


		scope :visibility,  lambda{where(:visilibity => true)}
		scope :invisibility, lambda{where(:visilibity => false)}
		scope :sort,  lambda{order("galeries.position ASC")}
		scope :najnowsza,  lambda{order("galeries.created_at DESC")}
end
