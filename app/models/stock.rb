class Stock < ActiveRecord::Base
	validates :name, :price, :quantity, presence: true
end
