class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
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