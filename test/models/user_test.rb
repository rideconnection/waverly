require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:read_client_authorizations).class_name('ClientAuthorization').with_foreign_key(:reader_id).dependent(:nullify)
  
  # Character requirements not met
  should_not allow_value("aaaaaaaa").for(:password)
  should_not allow_value("AAAAAAAA").for(:password)
  should_not allow_value("11111111").for(:password)
  should_not allow_value("!!!!!!!!").for(:password)
  should_not allow_value("aAaAaAaA").for(:password)
  should_not allow_value("a1a1a1a1").for(:password)
  should_not allow_value("a!a!a!a!").for(:password)
  should_not allow_value("A1A1A1A1").for(:password)
  should_not allow_value("A!A!A!A!").for(:password)
  should_not allow_value("1!1!1!1!").for(:password)
  should_not allow_value("aA1aA1aA").for(:password)
  should_not allow_value("aA!aA!aA").for(:password)
  should_not allow_value("a1!a1!a1").for(:password)
  should_not allow_value("A1!A1!A1").for(:password)

  # Too short
  should_not allow_value("aA1!aA1").for(:password)
  should_not allow_value("aA1    ").for(:password)
  
  # Too long
  should_not allow_value("aA1!aA1!aA1!aA1!aA1!a").for(:password)
  should_not allow_value("aA1!!!!!!!!!!!!!!!!!!").for(:password)

  # Just right
  should allow_value("aA1!aA1!").for(:password)
  should allow_value("aA1 aA1 ").for(:password)
  should allow_value("aA1!aA1!aA1!aA1!aA1!").for(:password)
  should allow_value("aA1                 ").for(:password)
  
  should validate_presence_of(:name)
end
