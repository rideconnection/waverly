class UploadedTrip < ActiveRecord::Base
  belongs_to :upload
  
  validates_presence_of :prime_number
end
