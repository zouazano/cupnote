class AddAmazonIdToCups < ActiveRecord::Migration[5.2]
  def change
  	add_column :cups, :amazon_id, :string
  end
end
