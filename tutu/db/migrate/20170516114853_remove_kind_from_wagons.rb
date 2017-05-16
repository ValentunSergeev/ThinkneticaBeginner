class RemoveKindFromWagons < ActiveRecord::Migration[5.0]
  def change
    remove_column :wagons, :kind
  end
end
