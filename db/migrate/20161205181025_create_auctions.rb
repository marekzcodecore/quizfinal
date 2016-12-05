class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.integer :min_price
      t.datetime :end_date
      t.datetime :start_date

      t.timestamps
    end
  end
end
