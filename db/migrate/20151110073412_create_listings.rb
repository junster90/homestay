class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :summary
    	t.string :hometype
    	t.string :roomtype
    	t.string :max_guest
    	t.string :line1
    	t.string :line2
    	t.string :city
    	t.string :state
    	t.string :zip
    	t.string :country
    	t.string :bedroom
    	t.string :bed_count
    	t.string :bathroom
    	t.integer :price

    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
