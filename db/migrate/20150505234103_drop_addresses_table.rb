class DropAddressesTable < ActiveRecord::Migration
  def up
  	drop_table :
  	drop_table :addresses
  end
end
