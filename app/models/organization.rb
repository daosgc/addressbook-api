# == Schema Information
#
# Table name: organizations
#
#  id                   :bigint           not null, primary key
#  business_name        :string
#  legal_representative :string
#  economic_activity    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Organization < ApplicationRecord
  begin :relationships
    has_many :employees
    has_many :users, through: :employees
  end
end
