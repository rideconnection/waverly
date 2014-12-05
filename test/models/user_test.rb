require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:read_client_authorizations).class_name('ClientAuthorization').with_foreign_key(:reader_id).dependent(:nullify)
end
