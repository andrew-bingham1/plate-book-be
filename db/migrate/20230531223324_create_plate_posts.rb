class CreatePlatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :plate_posts do |t|
      t.string :photo_url, default: nil
      t.references :plate, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
