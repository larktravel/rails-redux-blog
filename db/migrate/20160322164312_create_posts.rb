class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.string :category
      t.text :body

      t.timestamps null: false
    end
  end
end
