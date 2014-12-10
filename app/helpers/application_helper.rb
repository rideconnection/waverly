module ApplicationHelper
  def cache_key_for_uploads
    count          = Upload.count
    max_updated_at = Upload.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "uploads/all-#{count}-#{max_updated_at}"
  end

  def cache_key_for_users
    count          = User.count
    max_updated_at = User.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "users/all-#{count}-#{max_updated_at}"
  end

  def cache_key_for_user(user, current_user)
    user_updated_at = user.updated_at.try(:utc).try(:to_s, :number)
    current_user_updated_at = current_user.updated_at.try(:utc).try(:to_s, :number)
    "users/#{user.id}-#{user_updated_at}-#{current_user_updated_at}"
  end
end
