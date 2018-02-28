class MoviePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    return true if user.present? && user.admin?
  end
 
  def update?
    return true if user.present? && user.admin?
  end
 
  def destroy?
    return true if user.present? && user.admin?
  end

  def add?
    return true if user.present? && user.admin?
  end
 
  private
 
  def movie
    record
  end
end