class Business < ActiveRecord::Base
	validates :name, presence: true
	has_many :users
	has_many :products
end
