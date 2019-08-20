# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :post_id
      t.integer :commenter_id
      t.timestamps
    end
    add_foreign_key :comments, :users, column: :commenter_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
