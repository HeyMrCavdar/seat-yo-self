class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations
	has_and_belongs_to_many :categories

	def available?(party_size, proposed_time)
		return false if party_size <= 0
		party_size <= (capacity - reservations.where(time: proposed_time).sum(:party_size) )
	end
end
