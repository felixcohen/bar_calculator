class Business < ActiveRecord::Base
	validates :name, presence: true
	has_many :users
	has_many :products
	has_many :discounts

	def generate_token
		self.token = SecureRandom.urlsafe_base64
		self.save
	end
end
