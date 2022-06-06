class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :type, null: false
      t.datetime :date, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
