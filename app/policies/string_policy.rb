class StringPolicy < ApplicationPolicy
  attr_reader :user, :organization_id

  def initialize(user, organization_id)
    @user = user
    @organization_id = organization_id
  end

  def authorize?
    @employee = Employee.where(
      organization_id: organization_id,
      user: user
    ).first
    @employee.present?
  end

end
