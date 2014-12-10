class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
        
    if user.administrator?
      can :manage, :all
      cannot :destroy, User, id: user.id
    else
      can :read, User
      can :update, User, id: user.id
      can :manage, [Upload, UploadedTrip, ClientAuthorization]
    end
  end
end
