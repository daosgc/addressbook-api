class UpdateColumnsUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin
    remove_column :users, :boolean
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
