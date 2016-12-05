class AddTitleToAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.integer :min_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
