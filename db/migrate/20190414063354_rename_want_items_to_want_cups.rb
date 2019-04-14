class RenameWantItemsToWantCups < ActiveRecord::Migration[5.2]
  def change
  	rename_table :want_items, :want_cups
  end
end
