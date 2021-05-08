class VideoPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && user == record.user
  end

  def new?
    user.present?
  end

  def update?
    return true if user.present? && user.admin?
    user.present? && user == record.user
  end
end