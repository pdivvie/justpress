class TopicPolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, topic)
    @user = user
    @topic = topic
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