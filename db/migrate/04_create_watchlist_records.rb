class CreateWatchlistRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlist_records do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
