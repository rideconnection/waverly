class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :read_uploads, class_name: 'Upload', foreign_key: :reader_id
  
  validate do |user|
    # minimum 8 characters with at least one of each of the following: lower case alpha, upper case alpha, number, and non-alpha-numerical
    if user.password_required? && (
      user.password.blank?                    || # Cannot be empty
      !(8..20).include?(user.password.length) || # 8 - 20 characters
      !user.password.match(/[A-Z]/)           || # at least one lowercase letter
      !user.password.match(/[a-z]/)           || # at least one uppercase letter
      !user.password.match(/\d/)              || # at least one number
      !user.password.match(/[\W_&&[^\s] ]/)      # at least one non-alphanumeric character
    )
      user.errors[:password] << "does not meet complexity requirements. Passwords must be 8 to 20 characters in length with at least one of each of the following: lower case alpha, upper case alpha, number, and non-alpha-numerical"
    end
  end
  
  validates_presence_of :name
  
  before_validation :generate_a_password, :on => :create
  
  default_scope { order(name: :asc) }
  
  # Temporary attribute for auto-generated password tokens
  attr_accessor :must_generate_password
  
  def need_to_generate_password?
    !!must_generate_password
  end

  def display_name
    if name.blank?
      email
    else
      name
    end
  end

  private

  def generate_a_password
    if need_to_generate_password?
      temp_token = (Devise.friendly_token.first(16) +
        Array("a".."z").shuffle.first +
        Array("A".."Z").shuffle.first +
        Array("0".."9").shuffle.first +
        "!@\#$%^&*".split("").shuffle.first).split("").shuffle.join("")
      self.password = self.password_confirmation = temp_token
      self.reset_password_token = User.reset_password_token
      self.reset_password_sent_at = Time.zone.now
    end
  end
end
