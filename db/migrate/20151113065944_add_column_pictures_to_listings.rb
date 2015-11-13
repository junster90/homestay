class AddColumnPicturesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :pictures, :json
  end
end
