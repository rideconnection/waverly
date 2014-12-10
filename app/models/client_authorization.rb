class ClientAuthorization < ActiveRecord::Base
  belongs_to :reader, class_name: 'User', inverse_of: :read_client_authorizations
  
  scope :read, -> { where.not read_at: nil }
  scope :unread, -> { where read_at: nil }
  
  self.per_page = 10

  def full_name
    [first_name, last_name].compact.join(" ")
  end
  
  def read?
    read_at.present?
  end
end
