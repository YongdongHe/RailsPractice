class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	attr_accessible :name, :email, :password, :password_confirmation
	
	
	validates :name , :presence => true , :length => {:maximum => 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email , :presence => true , :format => {:with => VALID_EMAIL_REGEX} , :uniqueness => { :case_sensitive => false}
	
	# validates :password , :presence =>true , :length => {:minimum => 6}
	# validates :password_confirmation , :presence => true
	has_secure_password
	validates :password , :length => {:minimum => 6}

	before_save {self.email = email.downcase}
	before_create :create_remember_token

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		#添加生成remember_token的函数
    	def create_remember_token
      		self.remember_token = User.hash(User.new_remember_token)
    	end
end
