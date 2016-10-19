class CreateExchangeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_rates do |t|
      t.date :period
      t.integer :unit

      t.timestamps
    end
  end
end
