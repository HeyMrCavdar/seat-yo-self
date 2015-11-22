class AddDescriptionAndTimesToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :description, :string
    add_column :restaurants, :opening_time, :datetime
    add_column :restaurants, :closing_time, :datetime
  end
end
