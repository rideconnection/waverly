module ApplicationHelper
  def cache_key_for_uploads(params = {})
    "uploads/all-#{build_cache_key(Upload, params)}"
  end

  def cache_key_for_users(params = {})
    "users/all-#{build_cache_key(User, params)}"
  end

  def cache_key_for_user(user, current_user)
    user_updated_at = user.updated_at.try(:utc).try(:to_s, :number)
    current_user_updated_at = current_user.updated_at.try(:utc).try(:to_s, :number)
    "users/#{user.id}-#{user_updated_at}-#{current_user_updated_at}"
  end

  def cache_key_for_client_authorizations(params = {})
    "client_authorizations/all-#{build_cache_key(ClientAuthorization, params)}"
  end
  
  private
  
  def build_cache_key(klass, params)
    count          = klass.count
    max_updated_at = klass.maximum(:updated_at).try(:utc).try(:to_s, :number)
    cache_keys = [count, max_updated_at] + params.stringify_keys.sort.flatten
    cache_keys.join("-")
  end
end
