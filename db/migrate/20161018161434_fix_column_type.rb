class FixColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :exchange_rates, :unit, :float
  end
end
