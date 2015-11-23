class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :party_size, numericality: {only_integer: true}
	validates :time, presence: true

	validate :has_sufficient_capacity, :not_double_booking

	def has_sufficient_capacity
		unless restaurant.is_available?(party_size, time)
			errors.add(:restaurant, "Restaurant only has capacity of #{restaurant.current_capacity(time)}")
		end
	end

	def not_double_booking
		if user.has_reservation?(time)
			errors.add(:user, "You already have a reservation at #{restaurant.name} for that time")
		end
	end

end
