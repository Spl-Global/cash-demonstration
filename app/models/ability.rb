# frozen_string_literal: true

# :Ability class to handle Application authorization:
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.has_role? :student
      can :manage, :all
    elsif user.has_role? :teacher
      cannot :manage, :all
      can :manage, :user_panel
    else
      cannot :manage, :all
    end
  end
end
