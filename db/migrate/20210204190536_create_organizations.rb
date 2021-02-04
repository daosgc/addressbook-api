class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :business_name
      t.string :legal_representative
      t.string :economic_activity

      t.timestamps
    end
  end
end
