class OrganizationPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    @user.is_admin
  end

  def index?
    true
  end

  def update?
    @user.is_admin
  end
end
