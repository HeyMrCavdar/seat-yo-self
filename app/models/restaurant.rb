class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations
	has_and_belongs_to_many :categories

	def self.search(search)
	  if search
	    all.select{|m| m.name.include? "#{search}"}
	  else
	    all
	  end
	end

	def is_available?(party_size, proposed_time)
		return false if party_size.nil? || party_size <= 0
		party_size <= current_capacity(proposed_time)
	end

	def current_capacity(time)
		capacity - reservations.where(time: time).sum(:party_size)
	end

end
