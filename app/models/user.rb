class User < ActiveRecord::Base

	before_save { |user| user.email = email.downcase }

	validates :name, presence:true, length: {maximum:50}

	VALID_EMAIL_PATTERN = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true, format: { with: VALID_EMAIL_PATTERN}, uniqueness: { case_sensitive: false}
	has_secure_password
	validates :password, presence: true, length: {minimum:6}		
	
end
