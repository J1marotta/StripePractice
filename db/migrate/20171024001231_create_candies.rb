class CreateCandies < ActiveRecord::Migration[5.1]
  def change
    create_table :candies do |t|
      t.text :image_data
      t.integer :price
      t.string :name
      t.text :Caption

      t.timestamps
    end
  end
end
