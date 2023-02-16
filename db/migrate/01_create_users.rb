class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.float :total_balance, default: 10000.00
      t.float :buying_power, default: 10000.00
      t.timestamps
    end
  end
end
