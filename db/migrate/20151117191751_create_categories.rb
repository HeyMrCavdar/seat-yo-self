class CreateCategories < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :categories_restaurants do |t|
    	t.belongs_to :restaurant, index: true
      t.belongs_to :category, index: true
    end

  end
end
