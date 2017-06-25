class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user, null: false
      t.integer :link, null: false

      t.timestamps null: false
    end

    add_index :comments, :user
    add_index :comments, :link 
  end
end
