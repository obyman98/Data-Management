class ChaneLocationToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :city, :string
    add_column :lists, :state, :string
    remove_column :lists, :location, :string
  end
end
