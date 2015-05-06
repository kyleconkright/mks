class DropAddressesTable < ActiveRecord::Migration
  def up
  	drop_table :addresses
  end
end
e