class CreateProdsAndReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :origin
      t.date :date_caught
      t.timestamps
    end

    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :comment
      t.integer :rating
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
