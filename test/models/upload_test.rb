require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  should have_many(:uploaded_trips).autosave(true)
  
  should "set the uploaded_at on create" do
    upload = Upload.new
    assert upload.uploaded_at.blank?
    assert upload.save
    assert upload.uploaded_at.present?
  end
end
