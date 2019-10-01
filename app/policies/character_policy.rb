class CharacterPolicy < ApplicationPolicy
  attr_reader :user, :character

  def initialize(user, character)
    @user = user
    @character = character
  end

  def create?
    user.has_role? :admin
  end

  def new?
    create?
  end

  def update?
    user.has_role? :admin
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role? :admin
  end
end