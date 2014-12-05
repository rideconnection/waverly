require 'test_helper'

class ClientAuthorizationTest < ActiveSupport::TestCase
  should belong_to(:reader).class_name('User').inverse_of(:read_client_authorizations)
end
