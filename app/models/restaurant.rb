class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations
	has_and_belongs_to_many :categories

	def is_available?(party_size, proposed_time)
		return false if party_size <= 0
		party_size <= current_capacity(proposed_time)
	end

	def current_capacity(time)
		capacity - reservations.where(time: time).sum(:party_size)
	end
end
