class AddMakerIdToCups < ActiveRecord::Migration[5.2]
  def change
    add_column :cups, :maker_id, :integer
  end
end
