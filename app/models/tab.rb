class Tab < ActiveRecord::Base
	has_many :sales, dependent: :destroy

	validates :name, presence: true

	def total
		total = 0
		self.sales.each do |sale|
			total =  total + sale.product.cost
		end
		return total
	end

	scope :paid, -> { where(paid: true) }
	scope :unpaid, -> { where(paid: false) }

end

