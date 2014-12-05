require 'test_helper'

class UploadedTripTest < ActiveSupport::TestCase
  should belong_to(:upload)
  should validate_presence_of(:prime_number)
end
