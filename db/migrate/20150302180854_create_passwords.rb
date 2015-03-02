class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
