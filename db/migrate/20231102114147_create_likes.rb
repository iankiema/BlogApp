class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
    end

    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
