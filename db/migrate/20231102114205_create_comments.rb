class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :text

      t.timestamps
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
    end

  end
end
