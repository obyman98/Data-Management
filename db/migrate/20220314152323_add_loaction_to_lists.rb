class AddLoactionToLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :city, :string
    remove_column :lists, :state, :string
    add_column :lists, :location, :string

  end
end
