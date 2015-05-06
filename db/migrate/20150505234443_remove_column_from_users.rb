class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :address_id, :string
  end
end
