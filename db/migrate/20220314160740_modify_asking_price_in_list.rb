class ModifyAskingPriceInList < ActiveRecord::Migration[6.1]
  def change
    change_column :lists, :asking_price, :integer, using: 'asking_price::integer'
  end
end
