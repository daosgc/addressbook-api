# == Schema Information
#
# Table name: employees
#
#  id              :bigint           not null, primary key
#  organization_id :bigint
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Employee < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :organization
  end
end
