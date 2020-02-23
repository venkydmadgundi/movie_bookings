class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :theatre, null: false, foreign_key: true
      t.date :show_date
      t.references :timing, null: false, foreign_key: true
      t.integer :available_seats
      t.decimal :seat_price, precision: 4, scale: 2

      t.timestamps
    end
  end
end
