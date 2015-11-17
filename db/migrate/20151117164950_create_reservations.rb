class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.belongs_to :user
    	t.belongs_to :restaurant
    	t.integer :party_size
    	t.datetime :time
      t.timestamps null: false
    end
  end
end
