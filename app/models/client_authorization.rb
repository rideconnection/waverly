class ClientAuthorization < ActiveRecord::Base
  belongs_to :reader, class_name: 'User', inverse_of: :read_client_authorizations
  
  scope :read, -> { where.not read_at: nil }
  scope :unread, -> { where read_at: nil }
  
  self.per_page = 100
  
  validates :dob,                 :timeliness => {:type => :date}
  validates :current_date_begins, :timeliness => {:type => :date}
  validates :current_date_ends,   :timeliness => {:type => :date}
  validates :current_enter_date,  :timeliness => {:type => :date}

  def full_name
    [first_name, last_name].compact.join(" ")
  end
  
  def read?
    read_at.present?
  end

  def action_description
    if current_action == 'C'
      'Eligibility or Case Manager Change'
    elsif current_action == 'N'
      'New Customer'
    else
      "Action Code \"#{current_action}\""
    end
  end
end
