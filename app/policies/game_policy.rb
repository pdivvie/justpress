class GamePolicy < ApplicationPolicy
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def index?
    true
  end

  def show?
    true
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