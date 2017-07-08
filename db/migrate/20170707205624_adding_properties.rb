class AddingProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :products, :description, :string
    add_column :products, :image, :string
  end
end
