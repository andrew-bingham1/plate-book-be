class CreatePlates < ActiveRecord::Migration[7.0]
  def change
    create_table :plates do |t|
      t.string :plate_number

      t.timestamps
    end
  end
end
