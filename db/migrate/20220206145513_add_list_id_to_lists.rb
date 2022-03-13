class AddListIdToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :list_id, :string
  end
end
