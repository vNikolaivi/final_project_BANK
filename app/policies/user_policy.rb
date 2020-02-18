class UserPolicy < ApplicationPolicy
  def update?
    user.admin? || user.manager? || record.try(:user) == user
  end
end