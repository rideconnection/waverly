require 'test_helper'

class UploadedTripTest < ActiveSupport::TestCase
  should belong_to(:upload)
end
