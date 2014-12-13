require 'csv'

class Upload < ActiveRecord::Base
  has_many :uploaded_trips, autosave: true
  
  self.per_page = 10
  
  validate :has_uploaded_trips?

  before_create :set_uploaded_at
  
  def built_uploaded_trips_from_file(file)
    begin
      CSV.foreach(file.path, headers: true) do |row|
        # Strip out non-printing characters from the header row
        row_hash = Hash[row.to_hash.map {|k,v| [k.gsub(/[^0-9A-Za-z_]/, '') ,v]}]
        uploaded_trips.build row_hash
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
