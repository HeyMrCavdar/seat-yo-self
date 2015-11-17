class RemoveUserIdFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :user_id, :integer
  end
end
