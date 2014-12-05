module ApplicationHelper
  def cache_key_for_uploads
    count          = Upload.count
    max_updated_at = Upload.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "uploads/all-#{count}-#{max_updated_at}"
  end
end
