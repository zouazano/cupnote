class CreateWantItems < ActiveRecord::Migration[5.2]
  def change
    create_table :want_items do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cup, index: true, foreign_key: true

      t.timestamps
    end
  end
end
