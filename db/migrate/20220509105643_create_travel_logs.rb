class CreateTravelLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_logs do |t|
      t.string :trip_name
      t.date :date
      t.string :travel_log

      t.timestamps
    end
  end
end
