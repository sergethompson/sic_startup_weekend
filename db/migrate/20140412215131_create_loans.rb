class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :loan_id
      t.float :original
      t.float :owed
      t.float :balance

      t.timestamps
    end
  end
end
