class CreateUploadedTrips < ActiveRecord::Migration
  def change
    create_table :uploaded_trips do |t|
      t.references :upload, index: true
      t.string :prime_number
      t.string :client_last
      t.string :client_first
      t.string :client_mi
      t.string :trip_id
      t.date :service_date
      t.time :pickup_time
      t.time :appt_time
      t.boolean :will_call
      t.string :pickup_name
      t.string :pickup_address
      t.string :pickup_city
      t.string :pickup_state
      t.string :pickup_zip
      t.string :dropoff_name
      t.string :dropoff_address
      t.string :dropoff_city
      t.string :dropoff_state
      t.string :dropoff_zip
      t.string :reason
      t.string :status
      t.string :mode
      t.float :mileage

      t.timestamps
    end
  end
end
