class AddColumnQuantityToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :size, :string
  end
end
