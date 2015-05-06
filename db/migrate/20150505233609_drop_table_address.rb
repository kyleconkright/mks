class DropTableAddress < ActiveRecord::Migration
  def down
      drop_table :addresses
      
  end

end
