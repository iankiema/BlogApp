# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, :all

    if user.admin?
      can :manage, :all
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
