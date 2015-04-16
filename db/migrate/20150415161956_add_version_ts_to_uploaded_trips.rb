class AddVersionTsToUploadedTrips < ActiveRecord::Migration
  def change
    change_table :uploaded_trips do |t|
      t.datetime :version_ts 
    end
  end
end
