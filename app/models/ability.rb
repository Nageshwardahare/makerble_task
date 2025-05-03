class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, :all
    end

    if user.doctor?
      can :read, Patient
      cannot [ :update, :destroy ], Patient
    end

    if user.receptionist?
      can [ :create, :read, :update, :destroy ], Patient
    end
  end
end
