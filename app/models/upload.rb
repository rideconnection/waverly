require 'csv'

class Upload < ActiveRecord::Base
  has_many :uploaded_trips, autosave: true, dependent: :destroy
  
  self.per_page = 10
  
  validate :has_uploaded_trips?

  before_create :set_uploaded_at
  
  def built_uploaded_trips_from_file(file)
    begin
      CSV.foreach(file.path, headers: true, encoding: "BOM|UTF-8") do |row|
        this_row = row.to_hash
        if this_row['service_date'] =~ /^\d{1,2}\/\d{1,2}\/\d{4}$/
          this_row['service_date'] = Time.strptime(this_row['service_date'], "%m/%d/%Y")
        else
          this_row['service_date'] = Time.parse(this_row['service_date'])
        end
        if this_row['version_ts'] =~ /^\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}$/
          this_row['version_ts'] = Time.strptime(this_row['version_ts'], "%m/%d/%Y %H:%M")
        else
          this_row['version_ts'] = Time.parse(this_row['version_ts'])
        end
        unless UploadedTrip.where(trip_id: this_row["trip_id"], version_ts: this_row["version_ts"]).exists?
          UploadedTrip.where(trip_id: this_row["trip_id"]).update_all is_current: false
          uploaded_trips.build this_row
        end
      end
    rescue => e
      uploaded_trips(true)
      errors.add :base, "Could not build uploaded trips from file: #{e.message}"
    end
    uploaded_trips
  end
  
  private
  
  def set_uploaded_at
    self.uploaded_at = Time.current
  end
  
  def has_uploaded_trips?
    errors.add :base, "Your upload must contain at least one row of trip data" if uploaded_trips.reject(&:marked_for_destruction?).empty?
  end
end
