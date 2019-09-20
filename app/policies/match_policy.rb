class MatchPolicy < ApplicationPolicy
  attr_reader :user, :match

  def initialize(user, match)
    @user = user
    @match = match
  end

  def update?
    (match.user_id == user.id) || (user.has_role? :admin)
  end

  def edit?
    (match.user_id == user.id) || (user.has_role? :admin)
  end

  def destroy?
    (match.user_id == user.id) || (user.has_role? :admin)
  end
end