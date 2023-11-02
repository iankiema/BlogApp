class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :posts_counter
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :comments, :user_id
  end
end
