class ClientAuthorization < ActiveRecord::Base
  belongs_to :reader, class_name: 'User', inverse_of: :read_client_authorizations
end
