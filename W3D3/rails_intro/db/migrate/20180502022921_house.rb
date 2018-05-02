class HouseTable < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address, null: false
      t.timestamp
    end
  end
end
