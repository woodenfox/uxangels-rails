class AddLocationToAngels < ActiveRecord::Migration
  def change
    add_column :angels, :location, :string
  end
end
