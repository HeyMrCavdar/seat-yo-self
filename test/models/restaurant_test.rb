require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  setup do
  	@restaurant = FactoryGirl.create(:restaurant)
  	@time = Time.now.beginning_of_hour
  end

  test "restaurant is available" do
  	assert @restaurant.available?(10, @time)
  end

  test "restaurant is not available" do
  	assert_not @restaurant.available?(200, @time)
  end

  test "restaurant is not available if there isn't enough room" do
  	FactoryGirl.create(:reservation, restaurant: @restaurant, party_size: 99, time: Time.now.beginning_of_hour)
  	assert_not @restaurant.available?(10, @time)
	end

	test "restaurant is available if there is room" do
		FactoryGirl.create(:reservation, restaurant: @restaurant, party_size: 10, time: Time.now.beginning_of_hour)
  	assert @restaurant.available?(10, @time)
	end

	test "restaurant is not available if there's a reservation at the same time" do
		FactoryGirl.create(:reservation, restaurant: @restaurant, party_size: 99, time: Time.now.beginning_of_hour)
  	assert_not @restaurant.available?(10, Time.now.beginning_of_hour)
	end
end
