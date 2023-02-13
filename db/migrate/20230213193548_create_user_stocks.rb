class CreateUserStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stocks do |t|
      t.integer :quantity
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
