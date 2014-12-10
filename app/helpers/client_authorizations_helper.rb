module ClientAuthorizationsHelper
  def filter_state
    [@filter_state, "client authorization"].compact.join(" ")
  end
end
