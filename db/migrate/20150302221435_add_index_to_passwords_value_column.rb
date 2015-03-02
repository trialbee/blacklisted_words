class AddIndexToPasswordsValueColumn < ActiveRecord::Migration
  def up
    add_index :passwords, :value
  end

  def down
    remove_index :passwords, :value
  end
end
