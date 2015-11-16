class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.date :check_in
      t.date :check_out
      t.string :message

      t.timestamps null: false
    end
  end
end
