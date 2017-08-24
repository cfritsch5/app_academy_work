class CreateUpdateForeignIdNames < ActiveRecord::Migration
  def change
    rename_column :links, :user, :user_id
    rename_column :comments, :user, :user_id
    rename_column :comments, :link, :link_id
  end
end
