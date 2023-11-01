class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :author, null: false, foreign_key: true
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
