class AddImageIdToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :image_id, :string
  end
end
