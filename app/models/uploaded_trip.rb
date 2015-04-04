class UploadedTrip < ActiveRecord::Base
  belongs_to :upload
  
  validates_presence_of :prime_number

  scope :current_versions, -> { where('created_at = (SELECT MAX(created_at) FROM uploaded_trips AS ut WHERE ut.trip_id = uploaded_trips.trip_id)') }
end
