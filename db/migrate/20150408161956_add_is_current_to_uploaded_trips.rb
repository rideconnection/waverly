class AddIsCurrentToUploadedTrips < ActiveRecord::Migration
  def change
    change_table :uploaded_trips do |t|
      t.boolean :is_current, null: false, default: true
    end
  end
end
