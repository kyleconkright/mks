class AddProductDetailsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :quanitity, :integer
    add_column :orders, :size, :string
    add_column :orders, :status, :string
  end
end
