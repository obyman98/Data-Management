class AddSourceToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :source, :string
  end
end
