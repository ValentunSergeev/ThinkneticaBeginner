class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train
      t.integer :kind

      t.timestamps
    end
  end
end
