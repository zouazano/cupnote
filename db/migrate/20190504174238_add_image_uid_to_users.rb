class AddImageUidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_uid,  :string
  end
end
