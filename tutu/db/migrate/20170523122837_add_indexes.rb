class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :wagons, [:id, :type]
  end
end
