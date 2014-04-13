class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :employee_number
      t.string :name
      t.string :email
      t.string :position
      t.string :ssn
      t.string :ein
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :facebook
      t.float :score

      t.timestamps
    end
  end
end
