class UploadedTrip < ActiveRecord::Base
  belongs_to :upload
  
  validates_presence_of :prime_number

  scope :current_versions, -> { where(is_current: true) }
end
