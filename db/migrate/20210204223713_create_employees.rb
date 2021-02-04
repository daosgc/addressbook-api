class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
