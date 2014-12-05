require 'test_helper'

class ConsumerTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:private_key)
  should validate_uniqueness_of(:private_key)
end
