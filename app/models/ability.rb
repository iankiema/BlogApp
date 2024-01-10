# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # Guest user (not logged in)
    return unless user.present?

    can :read, :all
    can :create, [Comment, Post]

    if user.admin?
      can :manage, :all
    else
      can :manage, Post, author: user.id
      can :manage, Comment, user_id: user.id
    end
  end
end
