class User < ActiveRecord::Base

	has_secure_password

	validates :first_name, :last_name, :email, presence: true

	has_many :reservations
	has_many :restaurants, through: :reservations

	def has_reservation?(time)
		reservations.exists?(time: time)
	end
end
