class CreateUserPlates < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plates do |t|
      t.references :plate, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
