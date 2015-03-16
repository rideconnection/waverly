module ClientAuthorizationsHelper
  def filter_state
    [@query.filter_state, "client authorization"].compact.join(" ")
  end
end
