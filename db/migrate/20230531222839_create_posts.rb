class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :selected_tags
      t.float :lat
      t.float :lng
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
