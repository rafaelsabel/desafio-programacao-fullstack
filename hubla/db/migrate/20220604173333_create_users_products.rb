class CreateUsersProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :users_products do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end
