class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable and :omniauthable, :rememberable
  devise :database_authenticatable, :timeoutable, :recoverable, :trackable, :validatable
  
  self.per_page = 10
         
  has_many :read_client_authorizations, class_name: 'ClientAuthorization', foreign_key: :reader_id, inverse_of: :reader, dependent: :nullify
  
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
end
