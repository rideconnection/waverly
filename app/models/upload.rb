class Upload < ActiveRecord::Base
  has_many :uploaded_trips

  before_create :set_uploaded_at
  
  private
  
  def set_uploaded_at
    self.uploaded_at = Time.current
  end
end
