class Artykul < ActiveRecord::Base
	
	belongs_to :strona


	has_attached_file :images,
					  :styles => {:medium => "600x600>", :thumb => "200x200>" }
 	
 	validates_attachment_content_type :images,
									  :content_type => /^image\/(png|gif|jpeg)/,
									  :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

	validates_attachment_size   :images,	
								:in	=> 0..850.kilobytes,
								:message => '--- za duży plik max rozmiar to 850 kB ----'	



	
	validates :name,
			  :presence => true,
			  :length => {:maximum => 120, :message => "Za długi tytuł"}						


		scope :visibility,  lambda{where(:visilibity => true)}
		scope :invisibility, lambda{where(:visilibity => false)}
		scope :sort,  lambda{order("artykuls.position ASC")}
		scope :najnowsza,  lambda{order("artykuls.created_at DESC")}

end
