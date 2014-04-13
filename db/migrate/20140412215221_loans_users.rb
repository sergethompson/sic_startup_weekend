class LoansUsers < ActiveRecord::Migration
  def change
  	  create_table :loans_users do |t|
      t.integer :loan_id
      t.integer :user_id

      t.timestamps
    end
  end
end


