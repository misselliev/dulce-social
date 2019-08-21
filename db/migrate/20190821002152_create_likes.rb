class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: true
      t.integer :liker_id
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :liker_id
  end
end
