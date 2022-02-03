class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :url
      t.string :location
      t.string :asking_price
      t.string :revenue
      t.string :cash_flow
      t.string :ebitda
      t.string :sde
      t.string :industry
      t.text :business_summary

      t.timestamps
    end
  end
end
