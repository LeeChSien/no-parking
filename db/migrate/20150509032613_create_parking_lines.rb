class CreateParkingLines < ActiveRecord::Migration
  def change
    create_table :parking_lines do |t|
      t.string :length
      t.string :line_type
      t.string :maintained_at
      t.string :maintained_by
      t.multi_line_string :geom, :srid => 4326
      t.timestamps
    end

    change_table :parking_lines do |t|
      t.index :geom, :spatial => true
    end
  end
end
