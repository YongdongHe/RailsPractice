class User < ActiveRecord::Base
	validates :name , :presence => true , :length => {:maximun => 50}
	validates :email , :presence => true
end
